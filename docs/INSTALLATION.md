# Installation Guide for Antigravity Skills

This guide provides complete, step-by-step instructions for installing, configuring, updating, and removing skills from the **Antigravity Skills Toolkit**.

Whether you prefer a simple drag-and-drop manual installation or an automated cross-platform script, follow the instructions below.

---

## Table of Contents

1. [Understanding Antigravity Skills & Paths](#understanding-antigravity-skills--paths)
2. [Method A — Manual Installation (Simplest, Zero Dependencies)](#method-a--manual-installation)
3. [Method B — Automated Windows Installation (PowerShell)](#method-b--automated-windows-installation)
4. [Method C — Automated Linux & macOS Installation (Bash)](#method-c--automated-linux--macos-installation)
5. [Single-Skill vs All-Skills Installation](#single-skill-vs-all-skills-installation)
6. [Global vs Workspace Installation](#global-vs-workspace-installation)
7. [How to Verify Installed Skills](#how-to-verify-installed-skills)
8. [How to Update Skills](#how-to-update-skills)
9. [How to Uninstall Skills](#how-to-uninstall-skills)

---

## Understanding Antigravity Skills & Paths

Google Antigravity discovers skills by looking into two primary locations:

| Scope | Location (Windows) | Location (Linux / macOS) | Best For |
|---|---|---|---|
| **Global** (All projects on this machine) | `%USERPROFILE%\.gemini\config\skills\` | `~/.gemini/config/skills/` | General-purpose skills you want available in every project |
| **Workspace** (Current project only) | `<project-root>\.agents\skills\` | `<project-root>/.agents/skills/` | Project-specific workflows shared with team members via Git |

> [!NOTE]
> Antigravity also supports the alternative workspace folder `.agent/skills/`. The automated scripts install to `.agents/skills/` by default, which is the verified workspace standard.

---

## Method A — Manual Installation

Manual installation is the most reliable, dependency-free method. It requires no shell scripts, execution permissions, or terminal tools.

### Step 1: Download the Repository

1. Open the repository on GitHub: [`skiftekhar0909-max/antigravity-skills-public`](https://github.com/skiftekhar0909-max/antigravity-skills-public).
2. Click the green **Code** button at the top right of the file list.
3. Select **Download ZIP**.
4. Save the ZIP file to your computer (e.g., your `Downloads` folder).

### Step 2: Extract the Archive

1. Locate the downloaded file (e.g., `antigravity-skills-main.zip`).
2. Right-click and select **Extract All...** (on Windows) or double-click to uncompress (on macOS/Linux).
3. Open the extracted folder.

### Step 3: Locate the `skills` Directory

Inside the extracted repository root, you will find:
```text
antigravity-skills/
├── README.md
├── skills/
│   ├── code-explainer-human/
│   ├── code-optimizer-purifier/
│   ├── uiux-design-engine/
│   └── web-dev-architect/
└── ...
```

> [!IMPORTANT]
> **Do not copy the entire repository into your skills directory.** Antigravity expects individual skill folders (e.g., `uiux-design-engine`), each containing its own `SKILL.md`.

### Step 4: Copy the Desired Skill Folder

#### For Global Installation (Available everywhere):
- **Windows**:
  1. Press `Win + R` to open the Run dialog.
  2. Enter: `%USERPROFILE%\.gemini\config\skills` and press Enter. (If the folder does not exist, create it).
  3. Copy the individual skill folder(s) (e.g., `uiux-design-engine`) from the extracted repository into this folder.
- **macOS / Linux**:
  1. Open a terminal or Finder/file manager.
  2. Navigate to `~/.gemini/config/skills/` (create it with `mkdir -p ~/.gemini/config/skills` if needed).
  3. Copy the desired skill folder(s) there.

#### For Workspace Installation (Current project only):
1. In your application's project root, create a directory named `.agents/skills` if it does not already exist.
2. Copy the desired skill folder(s) directly into `.agents/skills/`.

> [!TIP]
> When copying `uiux-design-engine`, make sure to copy the entire folder including its `references/` subfolder so that design catalogues remain accessible to the skill.

### Step 5: Reload Antigravity
Restart Antigravity or reload the window to trigger discovery.

---

## Method B — Automated Windows Installation

We provide a native PowerShell script (`scripts/install.ps1`) designed specifically for Windows. **It does not require WSL, Git Bash, or Bash.**

### Quick Commands

Open PowerShell (`powershell.exe`) and navigate to your downloaded or cloned repository:

```powershell
# Navigate to the repository
Set-Location "$HOME\Downloads\antigravity-skills"

# Verify that the skills folder is present
Test-Path ".\skills"
```

#### Install All Skills to Global Configuration (Recommended):
```powershell
.\scripts\install.ps1 -Global
```

#### Install All Skills into Current Workspace (`.agents\skills`):
```powershell
.\scripts\install.ps1 -Workspace
```

#### Preview Without Making Changes (Dry-Run):
```powershell
.\scripts\install.ps1 -Global -DryRun
```

#### Force Overwrite Existing Skills:
```powershell
.\scripts\install.ps1 -Global -Force
```

### Dealing with PowerShell Script Execution Policy

If Windows blocks running the script with an execution policy error, run PowerShell with the `-ExecutionPolicy Bypass` scope for this specific command (this does not permanently lower system security):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 -Global
```

For more Windows-specific details and troubleshooting, see [docs/WINDOWS-GUIDE.md](WINDOWS-GUIDE.md).

---

## Method C — Automated Linux & macOS Installation

We provide a portable shell script (`scripts/install.sh`) for macOS and Linux environments.

### Quick Commands

Open your terminal and navigate to the repository:

```bash
cd ~/Downloads/antigravity-skills

# Ensure the installer script is executable
chmod +x scripts/install.sh scripts/uninstall.sh
```

#### Install All Skills to Global Configuration (`~/.gemini/config/skills`):
```bash
bash scripts/install.sh --global
```

#### Install All Skills into Current Project Workspace (`.agents/skills`):
```bash
# Navigate to your project root
cd /path/to/my-web-app

# Run the installer pointing back to the toolkit repo
bash /path/to/antigravity-skills/scripts/install.sh --workspace
```

#### Preview Changes Without Writing (Dry Run):
```bash
bash scripts/install.sh --global --dry-run
```

#### Overwrite Existing Skills:
```bash
bash scripts/install.sh --global --force
```

For more Linux/macOS details, see [docs/LINUX-MACOS-GUIDE.md](LINUX-MACOS-GUIDE.md).

---

## Single-Skill vs All-Skills Installation

You do not need to install every skill if you only need one or two.

### Windows PowerShell:
```powershell
# Install only the UI/UX design engine globally
.\scripts\install.ps1 -Global -Skill uiux-design-engine

# Install multiple specific skills
.\scripts\install.ps1 -Global -Skill uiux-design-engine, web-dev-architect
```

### Linux / macOS Bash:
```bash
# Install only the UI/UX design engine globally
bash scripts/install.sh --global --skill uiux-design-engine

# Install multiple specific skills
bash scripts/install.sh --global --skill uiux-design-engine --skill web-dev-architect
```

### Available Skill Names:
- `code-explainer-human`
- `code-optimizer-purifier`
- `uiux-design-engine`
- `web-dev-architect`

You can run `.\scripts\install.ps1 -List` or `bash scripts/install.sh --list` at any time to see the discovered list.

---

## Global vs Workspace Installation

Choose the scope that matches your workflow:

### When to choose **Global**:
- You want the skills available across all your existing and future projects.
- You are working on personal repositories or solo projects.
- You do not want to check skill folders into your project's Git repository.
- Location:
  - Windows: `%USERPROFILE%\.gemini\config\skills\`
  - Linux/macOS: `~/.gemini/config/skills/`

### When to choose **Workspace**:
- You want the entire development team to use the same skills when cloning the repository.
- You want project-specific customizations tracked in Git.
- Location: `<project-root>/.agents/skills/`

---

## How to Verify Installed Skills

After installing skills and reloading Antigravity, verify that the agent recognizes them:

1. **Check Discovery in Filesystem:**
   - **Windows:**
     ```powershell
     Get-ChildItem "$HOME\.gemini\config\skills"
     ```
   - **Linux/macOS:**
     ```bash
     ls -la ~/.gemini/config/skills
     ```
   You should see directories named after the skills with `SKILL.md` inside each.

2. **Verify with an Agent Prompt:**
   Open Antigravity and prompt the assistant:
   - For `code-explainer-human`: *"Explain what this file does in Hinglish like I am not a developer."*
   - For `uiux-design-engine`: *"Design a modern dark-mode pricing card for a SaaS product."*
   - For `code-optimizer-purifier`: *"Purify this component and eliminate redundant state."*
   - For `web-dev-architect`: *"Scaffold the folder architecture for a Next.js App Router project."*

If installed, the agent will automatically select and apply the corresponding skill.

---

## How to Update Skills

When new updates are pushed to this repository:

1. Pull the latest changes or download the latest ZIP:
   ```bash
   git pull origin main
   ```
2. Re-run the installer with the `-Force` (Windows) or `--force` (Unix) flag:
   - **Windows:**
     ```powershell
     .\scripts\install.ps1 -Global -Force
     ```
   - **Linux/macOS:**
     ```bash
     bash scripts/install.sh --global --force
     ```

---

## How to Uninstall Skills

We provide dedicated uninstaller scripts that safely remove toolkit skills without deleting your other personal skills.

### Windows PowerShell:
```powershell
# List installed skills in global config
.\scripts\uninstall.ps1 -Global -List

# Preview uninstalling all toolkit skills globally
.\scripts\uninstall.ps1 -Global -All -DryRun

# Remove all toolkit skills globally
.\scripts\uninstall.ps1 -Global -All

# Remove a single skill from workspace
.\scripts\uninstall.ps1 -Workspace -Skill uiux-design-engine
```

### Linux / macOS Bash:
```bash
# List installed skills
bash scripts/uninstall.sh --global --list

# Remove all toolkit skills globally
bash scripts/uninstall.sh --global --all

# Remove a single skill
bash scripts/uninstall.sh --global --skill uiux-design-engine
```

### Manual Uninstallation:
Simply delete the specific skill folder (e.g. `uiux-design-engine`) from `%USERPROFILE%\.gemini\config\skills\` or `<project-root>\.agents\skills\`.
