#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="${SCRIPT_DIR}/skills"
TARGET_DIR="$(pwd)/.agent/skills"

usage() {
  cat <<'EOF'
Usage:
  bash install.sh                 Install into ./.agent/skills/
  bash install.sh --global        Install into ~/.gemini/antigravity/skills/
  bash install.sh --target DIR    Install into a custom skills directory
  bash install.sh --help          Show this help

Existing skill folders are not deleted. Files with matching names may be overwritten.
Back up any locally customized skills before installing.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --global) TARGET_DIR="${HOME}/.gemini/antigravity/skills"; shift ;;
    --target)
      [[ $# -ge 2 ]] || { echo "Error: --target requires a directory." >&2; exit 1; }
      TARGET_DIR="$2"; shift 2 ;;
    --help|-h) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage >&2; exit 1 ;;
  esac
done

[[ -d "${SOURCE_DIR}" ]] || { echo "Error: skills directory not found: ${SOURCE_DIR}" >&2; exit 1; }
mkdir -p "${TARGET_DIR}"

installed=0
for skill_path in "${SOURCE_DIR}"/*/; do
  [[ -d "${skill_path}" ]] || continue
  skill_name="$(basename "${skill_path}")"
  [[ -f "${skill_path}SKILL.md" ]] || { echo "Skipping ${skill_name}: missing SKILL.md" >&2; continue; }
  mkdir -p "${TARGET_DIR}/${skill_name}"
  cp -R "${skill_path%/}/." "${TARGET_DIR}/${skill_name}/"
  echo "Installed/updated: ${skill_name}"
  installed=$((installed + 1))
done

echo "Done. ${installed} skill(s) installed into ${TARGET_DIR}"
echo "Restart Antigravity or reload the window to pick them up."
