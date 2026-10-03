# Linux & macOS Installation Guide

This guide provides instructions for installing and managing the **Antigravity Skills Toolkit** on Linux distributions (Ubuntu, Debian, Fedora, Arch, etc.) and macOS (macOS 12 Monterey, macOS 13 Ventura, macOS 14 Sonoma, and newer).

---

## Prerequisites

- A POSIX-compliant shell (`bash` or `zsh`).
- Standard core utilities (`mkdir`, `cp`, `rm`, `basename`, `dirname`).
- No external packages, Python modules, Node.js, or package managers are required.

---

## 3-Step Setup

1. **Open your Terminal:**
   - On macOS: Press `Cmd + Space`, type `Terminal`, and press Enter.
   - On Linux: Press `Ctrl + Alt + T` or open your terminal emulator.

2. **Navigate to the Repository Root:**
   ```bash
   cd ~/Downloads/antigravity-skills
   ```
   *(Replace with your actual directory path if different)*.

3. **Make Scripts Executable and Run:**
   ```bash
   chmod +x scripts/install.sh scripts/uninstall.sh
   bash scripts/install.sh --global
   ```

All skills are now installed into `~/.gemini/config/skills/`.

---

## Installation Options & Examples

### 1. Global Installation (Recommended)
Installs skills into `~/.gemini/config/skills/`, making them available across all Antigravity projects on your machine:

```bash
bash scripts/install.sh --global
```

### 2. Workspace Installation (Current Project Only)
Installs skills into the `.agents/skills/` folder of your current working directory:

```bash
# From within your project repository:
cd /path/to/my-web-project
bash /path/to/antigravity-skills/scripts/install.sh --workspace
```

### 3. Installing a Single Skill
If you only need one specific skill:

```bash
# Install only the UI/UX design engine globally:
bash scripts/install.sh --global --skill uiux-design-engine

# Install two specific skills:
bash scripts/install.sh --global --skill uiux-design-engine --skill web-dev-architect
```

### 4. Preview Changes (Dry-Run Mode)
Preview which files will be copied or skipped without making changes:

```bash
bash scripts/install.sh --global --dry-run
```

### 5. Overwrite Existing Skills
If you previously installed an older version and want to replace it:

```bash
bash scripts/install.sh --global --force
```

### 6. Custom Target Directory
If your environment uses a non-standard customization root:

```bash
bash scripts/install.sh --target /custom/path/to/skills
```

---

## Manual Installation (No Scripts)

If you prefer to install without running shell scripts:

1. Create the global skills folder if it doesn't already exist:
   ```bash
   mkdir -p ~/.gemini/config/skills
   ```
2. Copy the skill folders directly:
   ```bash
   cp -R skills/* ~/.gemini/config/skills/
   ```
3. Restart or reload Antigravity.

---

## Uninstallation on Linux & macOS

To safely remove toolkit skills:

```bash
# List installed skills in global directory
bash scripts/uninstall.sh --global --list

# Remove all toolkit skills globally
bash scripts/uninstall.sh --global --all

# Remove a specific skill
bash scripts/uninstall.sh --global --skill uiux-design-engine

# Preview removal without deleting
bash scripts/uninstall.sh --global --all --dry-run
```

The uninstaller checks against known toolkit skills and will never delete other custom skills in your directory.
