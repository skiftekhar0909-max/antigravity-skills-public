# Windows Installation & Troubleshooting Guide

This guide is written specifically for Windows users.

It explains how to install and manage the **Antigravity Skills Toolkit** natively on Windows 10 and Windows 11 **without requiring WSL (Windows Subsystem for Linux), Git Bash, or Linux emulators**.

---

## Quick Start for Windows

You do NOT need Linux or WSL installed to use these skills. Windows has built-in PowerShell that runs our native installer directly.

### 3-Step Setup

1. **Open PowerShell:**
   Press `Win + X` and select **Windows PowerShell** or **Terminal**.

2. **Navigate to the Repository Folder:**
   ```powershell
   Set-Location "$HOME\Downloads\antigravity-skills"
   ```
   *(Replace with your actual folder path if different)*.

3. **Run the PowerShell Installer:**
   ```powershell
   .\scripts\install.ps1 -Global
   ```

That is it! All skills will be installed into your global Antigravity configuration directory:
`C:\Users\<YourUsername>\.gemini\config\skills\`

---

## Detailed Step-by-Step Instructions

### Step 1: Download & Extract

1. Download the repository ZIP file from GitHub.
2. Extract the ZIP file by right-clicking it and selecting **Extract All...**.
3. Choose a destination, such as `C:\Users\<YourUsername>\Downloads\antigravity-skills`.

> [!WARNING]
> **Check for nested folders:**
> Windows ZIP extraction often creates a duplicate folder name, e.g.:
> `Downloads\antigravity-skills-main\antigravity-skills-main\`
> Make sure you navigate into the folder that directly contains the `skills` and `scripts` directories.

### Step 2: Verify Your Location in PowerShell

Run:
```powershell
# Check your current directory
Get-Location

# Verify that the skills folder is right here
Test-Path ".\skills"
```
If `Test-Path` returns `True`, you are in the correct directory.

### Step 3: Choose Your Installation Command

#### Option 1: Global Installation (Recommended)
Installs the skills so that any project opened in Antigravity on your computer can use them:
```powershell
.\scripts\install.ps1 -Global
```

#### Option 2: Workspace Installation
Installs the skills into your current project folder (`.agents\skills`):
```powershell
# From your project root, point to the script in the toolkit folder:
powershell -File "C:\path\to\antigravity-skills\scripts\install.ps1" -Workspace
```

#### Option 3: Install a Single Skill
If you only want one skill (for example, the UI/UX design engine):
```powershell
.\scripts\install.ps1 -Global -Skill uiux-design-engine
```

#### Option 4: Dry-Run (Preview only)
See what the script will do without writing or modifying files:
```powershell
.\scripts\install.ps1 -Global -DryRun
```

#### Option 5: Force Overwrite
If you previously installed older versions and want to overwrite them:
```powershell
.\scripts\install.ps1 -Global -Force
```

---

## Windows Troubleshooting & Common Errors

### 1. The WSL Error: "This application requires the Windows Subsystem for Linux Optional Component"

#### What happened:
You probably typed:
```powershell
bash install.sh
```
or double-clicked `install.sh`. On Windows systems without WSL installed, Windows invokes a placeholder executable `C:\Windows\System32\bash.exe`, which displays:
> *This application requires the Windows Subsystem for Linux Optional Component.*
> *Install it by running: wsl --install*

#### The Fix:
**You do NOT need to install WSL.**
Simply run the native Windows PowerShell installer instead:
```powershell
.\scripts\install.ps1 -Global
```

---

### 2. Execution Policy Error: "cannot be loaded because running scripts is disabled on this system"

#### What happened:
By default, Windows sets an `ExecutionPolicy` (such as `Restricted`) to protect users from untrusted scripts.

#### The Safe Fix (No system-wide weakening):
Instead of permanently changing your machine's global execution policy, run the installer with a single-use `-ExecutionPolicy Bypass` flag:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 -Global
```

This bypass applies strictly to this single command invocation and does not permanently change your computer's security settings.

---

### 3. Path Contains Spaces or Non-ASCII Characters

If your username or path contains spaces (for example, `C:\Users\John Doe\Downloads\antigravity-skills`):

Always wrap the path in quotes in PowerShell:
```powershell
Set-Location "C:\Users\John Doe\Downloads\antigravity-skills"
```

Our scripts use safe path binding and handle spaces cleanly.

---

### 4. Manual Installation Using Windows File Explorer (GUI)

If you prefer not using the command line at all:

1. Press `Win + R` on your keyboard to open the **Run** dialog.
2. In the text box, paste:
   ```text
   %USERPROFILE%\.gemini\config\skills
   ```
   and click **OK**.
   *(If Windows says the path cannot be found, navigate to `%USERPROFILE%\.gemini` and create the `config` and `skills` folders manually).*
3. Open a second File Explorer window showing the extracted `antigravity-skills\skills` folder.
4. Drag and drop any or all of the four skill folders (`uiux-design-engine`, `web-dev-architect`, `code-optimizer-purifier`, `code-explainer-human`) into `%USERPROFILE%\.gemini\config\skills\`.
5. Restart or reload Antigravity.

---

## Uninstallation on Windows

To safely remove toolkit skills on Windows:

```powershell
# List what skills are installed
.\scripts\uninstall.ps1 -Global -List

# Remove all toolkit skills globally
.\scripts\uninstall.ps1 -Global -All

# Remove a specific skill
.\scripts\uninstall.ps1 -Global -Skill uiux-design-engine
```
The uninstaller will never touch your other custom or third-party skills.
