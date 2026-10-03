#!/usr/bin/env bash
# ==============================================================================
# Antigravity Skills Toolkit - Unix / macOS Installer
# ==============================================================================
# Usage:
#   bash scripts/install.sh [OPTIONS]
#
# Examples:
#   bash scripts/install.sh                         # Install to current workspace (.agents/skills)
#   bash scripts/install.sh --global                # Install to ~/.gemini/config/skills
#   bash scripts/install.sh --skill uiux-design-engine  # Install single skill to workspace
#   bash scripts/install.sh --dry-run               # Preview what would be installed
#   bash scripts/install.sh --list                  # List available skills
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
SOURCE_DIR="${REPO_ROOT}/skills"

TARGET_DIR="$(pwd)/.agents/skills"
TARGET_SCOPE="Workspace ($(pwd)/.agents/skills)"
FORCE=0
DRY_RUN=0
REQUESTED_SKILLS=()

usage() {
  cat <<'EOF'
Antigravity Skills Toolkit - Unix/macOS Installer

Usage:
  bash scripts/install.sh [OPTIONS]

Options:
  --global            Install globally to ~/.gemini/config/skills
  --workspace         Install into current workspace .agents/skills (default)
  --target DIR        Install into a custom skills directory
  --skill NAME        Install a specific skill by name (can be repeated)
  --all               Install all discovered skills (default)
  --force, --overwrite Overwrite existing skill files
  --dry-run           Preview actions without copying files
  --list              List available skills in the repository and exit
  --help, -h          Show this help message

Examples:
  bash scripts/install.sh
  bash scripts/install.sh --global
  bash scripts/install.sh --skill uiux-design-engine --workspace
  bash scripts/install.sh --global --dry-run
EOF
}

# Verify source directory
if [[ ! -d "${SOURCE_DIR}" ]]; then
  echo "[-] Error: skills directory not found: ${SOURCE_DIR}" >&2
  exit 1
fi

# Discover available skills dynamically
DISCOVERED_SKILLS=()
for skill_path in "${SOURCE_DIR}"/*/; do
  if [[ -d "${skill_path}" ]] && [[ -f "${skill_path}SKILL.md" ]]; then
    skill_name="$(basename "${skill_path}")"
    DISCOVERED_SKILLS+=("${skill_name}")
  fi
done

if [[ ${#DISCOVERED_SKILLS[@]} -eq 0 ]]; then
  echo "[-] Error: No valid skills found in ${SOURCE_DIR}" >&2
  exit 1
fi

# Parse CLI arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --global)
      TARGET_DIR="${HOME}/.gemini/config/skills"
      TARGET_SCOPE="Global (${TARGET_DIR})"
      shift
      ;;
    --workspace)
      TARGET_DIR="$(pwd)/.agents/skills"
      TARGET_SCOPE="Workspace (${TARGET_DIR})"
      shift
      ;;
    --target)
      [[ $# -ge 2 ]] || { echo "[-] Error: --target requires a directory argument." >&2; exit 1; }
      TARGET_DIR="$2"
      TARGET_SCOPE="Custom (${TARGET_DIR})"
      shift 2
      ;;
    --skill)
      [[ $# -ge 2 ]] || { echo "[-] Error: --skill requires a skill name." >&2; exit 1; }
      REQUESTED_SKILLS+=("$2")
      shift 2
      ;;
    --all)
      REQUESTED_SKILLS=()
      shift
      ;;
    --force|--overwrite)
      FORCE=1
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --list)
      echo ""
      echo "=== Available Antigravity Skills in Repository ==="
      for s in "${DISCOVERED_SKILLS[@]}"; do
        echo "  * ${s}"
      done
      echo ""
      echo "To install a skill: bash scripts/install.sh --skill <name>"
      exit 0
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "[-] Error: Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

# Determine final list of skills to install
SKILLS_TO_INSTALL=()
if [[ ${#REQUESTED_SKILLS[@]} -gt 0 ]]; then
  for req in "${REQUESTED_SKILLS[@]}"; do
    found=0
    for disc in "${DISCOVERED_SKILLS[@]}"; do
      if [[ "${req}" == "${disc}" ]]; then
        SKILLS_TO_INSTALL+=("${req}")
        found=1
        break
      fi
    done
    if [[ ${found} -eq 0 ]]; then
      echo "[-] Error: Requested skill '${req}' not found in repository." >&2
      echo "Available skills:" >&2
      for s in "${DISCOVERED_SKILLS[@]}"; do
        echo "  - ${s}" >&2
      done
      exit 1
    fi
  done
else
  SKILLS_TO_INSTALL=("${DISCOVERED_SKILLS[@]}")
fi

echo ""
echo "=========================================================="
echo "          Antigravity Skills Toolkit Installer            "
echo "=========================================================="
echo "[*] Target Scope : ${TARGET_SCOPE}"
echo "[*] Destination  : ${TARGET_DIR}"
if [[ ${DRY_RUN} -eq 1 ]]; then
  echo "[!] MODE         : PREVIEW (DRY-RUN) - No changes will be written"
fi
echo ""

if [[ ${DRY_RUN} -eq 0 ]]; then
  mkdir -p "${TARGET_DIR}"
fi

installed=0
skipped=0

for skill in "${SKILLS_TO_INSTALL[@]}"; do
  src_path="${SOURCE_DIR}/${skill}"
  dest_path="${TARGET_DIR}/${skill}"

  if [[ -d "${dest_path}" ]] && [[ ${FORCE} -eq 0 ]]; then
    if [[ ${DRY_RUN} -eq 1 ]]; then
      echo "[DRY-RUN] Would SKIP '${skill}' (already exists, requires --force to overwrite)"
    else
      echo "[!] Skipped '${skill}': already exists at destination. Use --force to overwrite."
    fi
    skipped=$((skipped + 1))
    continue
  fi

  if [[ ${DRY_RUN} -eq 1 ]]; then
    if [[ -d "${dest_path}" ]]; then
      echo "[DRY-RUN] Would OVERWRITE '${skill}' -> ${dest_path}"
    else
      echo "[DRY-RUN] Would INSTALL '${skill}' -> ${dest_path}"
    fi
    installed=$((installed + 1))
    continue
  fi

  mkdir -p "${dest_path}"
  cp -R "${src_path}/." "${dest_path}/"
  echo "[+] Installed '${skill}' -> ${dest_path}"
  installed=$((installed + 1))
done

echo ""
echo "----------------------------------------------------------"
if [[ ${DRY_RUN} -eq 1 ]]; then
  echo "[*] Dry-run complete. Would install: ${installed}, Would skip: ${skipped}"
else
  echo "[+] Installation finished. Installed/updated: ${installed}, Skipped: ${skipped}"
  echo ""
  echo "Next steps:"
  echo "  1. If Antigravity is open, reload your window or restart the app."
  echo "  2. The agent will automatically discover the installed skills."
  echo "  3. To verify or trigger, prompt the agent with a skill-related query."
  echo "  4. To uninstall: bash scripts/uninstall.sh"
fi
echo "=========================================================="
echo ""
