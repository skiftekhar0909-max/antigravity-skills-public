#!/usr/bin/env bash
# ==============================================================================
# Antigravity Skills Toolkit - Unix / macOS Uninstaller
# ==============================================================================
# Usage:
#   bash scripts/uninstall.sh [OPTIONS]
#
# Examples:
#   bash scripts/uninstall.sh --all                 # Remove toolkit skills from workspace
#   bash scripts/uninstall.sh --global --all        # Remove toolkit skills globally
#   bash scripts/uninstall.sh --skill uiux-design-engine # Remove single skill
#   bash scripts/uninstall.sh --dry-run             # Preview removal
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
SOURCE_DIR="${REPO_ROOT}/skills"

TARGET_DIR="$(pwd)/.agents/skills"
TARGET_SCOPE="Workspace ($(pwd)/.agents/skills)"
DRY_RUN=0
REQUESTED_SKILLS=()
UNINSTALL_ALL=0

usage() {
  cat <<'EOF'
Antigravity Skills Toolkit - Unix/macOS Uninstaller

Usage:
  bash scripts/uninstall.sh [OPTIONS]

Options:
  --global            Target global skills (~/.gemini/config/skills)
  --workspace         Target current workspace .agents/skills (default)
  --target DIR        Target a custom directory
  --skill NAME        Uninstall a specific skill (can be repeated)
  --all               Uninstall all toolkit skills found in target
  --dry-run           Preview removal without deleting files
  --list              List skills currently installed in target
  --help, -h          Show this help message

Examples:
  bash scripts/uninstall.sh --all
  bash scripts/uninstall.sh --global --skill uiux-design-engine
  bash scripts/uninstall.sh --global --all --dry-run
EOF
}

# Discover known toolkit skills
KNOWN_SKILLS=()
if [[ -d "${SOURCE_DIR}" ]]; then
  for s in "${SOURCE_DIR}"/*/; do
    if [[ -d "${s}" ]]; then
      KNOWN_SKILLS+=("$(basename "${s}")")
    fi
  done
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
      UNINSTALL_ALL=1
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --list)
      echo ""
      echo "=== Installed Skills in ${TARGET_SCOPE} ==="
      if [[ ! -d "${TARGET_DIR}" ]]; then
        echo "  (Directory does not exist: ${TARGET_DIR})"
      else
        found=0
        for item in "${TARGET_DIR}"/*/; do
          if [[ -d "${item}" ]]; then
            bname="$(basename "${item}")"
            is_tk="[External Skill]"
            for k in "${KNOWN_SKILLS[@]}"; do
              if [[ "${bname}" == "${k}" ]]; then
                is_tk="[Toolkit Skill]"
                break
              fi
            done
            echo "  * ${bname} ${is_tk}"
            found=1
          fi
        done
        if [[ ${found} -eq 0 ]]; then
          echo "  (No skills installed)"
        fi
      fi
      echo ""
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

if [[ ! -d "${TARGET_DIR}" ]]; then
  echo "[!] Target directory does not exist: ${TARGET_DIR}"
  echo "[*] Nothing to uninstall."
  exit 0
fi

# Determine skills to remove
SKILLS_TO_REMOVE=()
if [[ ${#REQUESTED_SKILLS[@]} -gt 0 ]]; then
  for req in "${REQUESTED_SKILLS[@]}"; do
    if [[ -d "${TARGET_DIR}/${req}" ]]; then
      SKILLS_TO_REMOVE+=("${req}")
    else
      echo "[!] Skill '${req}' is not installed in ${TARGET_DIR}"
    fi
  done
elif [[ ${UNINSTALL_ALL} -eq 1 ]]; then
  for k in "${KNOWN_SKILLS[@]}"; do
    if [[ -d "${TARGET_DIR}/${k}" ]]; then
      SKILLS_TO_REMOVE+=("${k}")
    fi
  done
else
  echo "[!] No action specified. Please provide --skill <name> or --all to uninstall." >&2
  echo "    bash scripts/uninstall.sh --all" >&2
  echo "    bash scripts/uninstall.sh --skill <name>" >&2
  echo "    bash scripts/uninstall.sh --list" >&2
  exit 1
fi

if [[ ${#SKILLS_TO_REMOVE[@]} -eq 0 ]]; then
  echo "[*] No matching skills found to remove in ${TARGET_DIR}."
  exit 0
fi

echo ""
echo "=========================================================="
echo "          Antigravity Skills Toolkit Uninstaller          "
echo "=========================================================="
echo "[*] Target Scope : ${TARGET_SCOPE}"
echo "[*] Directory    : ${TARGET_DIR}"
if [[ ${DRY_RUN} -eq 1 ]]; then
  echo "[!] MODE         : PREVIEW (DRY-RUN) - No files will be deleted"
fi
echo ""

removed=0
for skill in "${SKILLS_TO_REMOVE[@]}"; do
  target_folder="${TARGET_DIR}/${skill}"
  if [[ ${DRY_RUN} -eq 1 ]]; then
    echo "[DRY-RUN] Would REMOVE: ${target_folder}"
    removed=$((removed + 1))
    continue
  fi

  rm -rf "${target_folder}"
  echo "[+] Removed: ${skill} from ${TARGET_DIR}"
  removed=$((removed + 1))
done

echo ""
echo "----------------------------------------------------------"
if [[ ${DRY_RUN} -eq 1 ]]; then
  echo "[*] Dry-run complete. Would remove: ${removed} skill(s)."
else
  echo "[+] Uninstallation complete. Removed: ${removed} skill(s)."
  echo "Remember to reload or restart Antigravity if it is open."
fi
echo "=========================================================="
echo ""
