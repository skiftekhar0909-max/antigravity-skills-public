# Comprehensive Troubleshooting Guide

This guide provides step-by-step solutions for 15 common issues encountered when installing, authoring, and using skills in Google Antigravity.

---

## Quick Navigation

1. [`SKILL.md` Not Found](#1-skillmd-not-found)
2. [Invalid YAML Frontmatter](#2-invalid-yaml-frontmatter)
3. [Skill Not Detected by Antigravity](#3-skill-not-detected-by-antigravity)
4. [Wrong Destination Directory](#4-wrong-destination-directory)
5. [Permission Denied](#5-permission-denied)
6. [PowerShell Script Execution Blocked](#6-powershell-script-execution-blocked)
7. [Missing WSL Component Error on Windows](#7-missing-wsl-component-error-on-windows)
8. [Bash Command Not Recognized on Windows](#8-bash-command-not-recognized-on-windows)
9. [Destination Skill Already Exists](#9-destination-skill-already-exists)
10. [Incorrect Repository Root](#10-incorrect-repository-root)
11. [ZIP Extracted into a Nested Folder](#11-zip-extracted-into-a-nested-folder)
12. [Installer Reports Success but No Skill Appears](#12-installer-reports-success-but-no-skill-appears)
13. [Existing Skill Content Differs from Repository](#13-existing-skill-content-differs-from-repository)
14. [Antigravity Requires a Restart or Reload](#14-antigravity-requires-a-restart-or-reload)
15. [A Reference File Cannot Be Found](#15-a-reference-file-cannot-be-found)

---

### 1. `SKILL.md` Not Found

- **Likely Cause:** The skill folder was copied without its `SKILL.md` file, the filename was mistyped (e.g. `skill.md`, `README.md`, or `SKILLS.md`), or files were placed in an incorrect directory level.
- **Verification Command:**
  - Windows PowerShell:
    ```powershell
    Test-Path "$HOME\.gemini\config\skills\uiux-design-engine\SKILL.md"
    ```
  - Linux / macOS:
    ```bash
    ls -l ~/.gemini/config/skills/uiux-design-engine/SKILL.md
    ```
- **Step-by-step Fix:**
  1. Ensure the filename is exactly `SKILL.md` (uppercase, `.md` extension).
  2. Verify that `SKILL.md` resides directly inside the skill directory: `<skills-dir>/<skill-name>/SKILL.md`.
  3. Re-run the installer script or copy the file directly.
- **Recovery Path:** Run repository validation to check all skills:
  `python tests/validate_repository.py`

---

### 2. Invalid YAML Frontmatter

- **Likely Cause:** The YAML block at the beginning of `SKILL.md` is missing opening or closing triple dashes (`---`), contains invalid indentation, or is missing required `name` or `description` fields.
- **Verification Command:**
  Run the validation test suite:
  ```bash
  python tests/validate_repository.py
  ```
- **Step-by-step Fix:**
  1. Open `SKILL.md` in your text editor.
  2. Ensure lines 1 to 4 look exactly like this:
     ```markdown
     ---
     name: skill-name-here
     description: Precise description of what this does and when it activates.
     ---
     ```
  3. Ensure there are no tabs inside the YAML block (use spaces only).
  4. Ensure `name` contains only lowercase letters, digits, and hyphens.
- **Recovery Path:** Copy the frontmatter template from [docs/SKILL-AUTHORING.md](SKILL-AUTHORING.md) and replace the invalid block.

---

### 3. Skill Not Detected by Antigravity

- **Likely Cause:** The skill was copied to a folder outside Antigravity's discovery path, or the Antigravity window has not been reloaded since the files were created.
- **Verification Command:**
  - Check global directory contents:
    - Windows: `Get-ChildItem "$HOME\.gemini\config\skills"`
    - Linux/macOS: `ls -la ~/.gemini/config/skills`
- **Step-by-step Fix:**
  1. Confirm skills reside in `%USERPROFILE%\.gemini\config\skills\` (Windows) or `~/.gemini/config/skills/` (Linux/macOS).
  2. In Antigravity / your IDE, open the command palette (`Ctrl + Shift + P` or `Cmd + Shift + P`) and run **Developer: Reload Window**, or restart the application completely.
  3. Test activating the skill with an explicit trigger phrase.
- **Recovery Path:** Re-run the installer with the `-Global` flag:
  `.\scripts\install.ps1 -Global -Force`

---

### 4. Wrong Destination Directory

- **Likely Cause:** Copying the entire repository into `.gemini/config/skills/` instead of individual skill folders, or copying into an outdated path such as `.gemini/antigravity/skills/`.
- **Verification Command:**
  Check whether a `skills` folder is nested inside your target folder:
  - Windows: `Test-Path "$HOME\.gemini\config\skills\skills"`
  - Linux/macOS: `test -d ~/.gemini/config/skills/skills && echo "Nested!"`
- **Step-by-step Fix:**
  1. If you see `skills/skills`, delete the misplaced folder.
  2. Ensure the destination contains immediate subdirectories named after each skill (`uiux-design-engine`, `web-dev-architect`, etc.).
  3. Use `scripts/install.ps1 -Global` or `scripts/install.sh --global` to automatically target the correct path.
- **Recovery Path:** Use `.\scripts\uninstall.ps1 -Global -All` to clean the directory, then reinstall cleanly with `.\scripts\install.ps1 -Global`.

---

### 5. Permission Denied

- **Likely Cause:** Installing into a protected directory without write permissions, or execution bits missing on Unix shell scripts.
- **Verification Command:**
  - Linux/macOS: `ls -ld ~/.gemini/config/skills`
  - Windows: Check if folder is marked Read-Only or owned by Administrator.
- **Step-by-step Fix:**
  - **Linux/macOS:**
    ```bash
    chmod +x scripts/install.sh scripts/uninstall.sh
    mkdir -p ~/.gemini/config/skills
    chmod -R u+rwX ~/.gemini/config/skills
    ```
  - **Windows:** Run PowerShell as your normal user (not elevated Administrator) so files are written with your user permissions.
- **Recovery Path:** Install into a custom user-writable directory using `-Target <dir>`.

---

### 6. PowerShell Script Execution Blocked

- **Likely Cause:** Windows Execution Policy defaults to `Restricted` or `RemoteSigned` for local script execution.
- **Verification Command:**
  ```powershell
  Get-ExecutionPolicy -List
  ```
- **Step-by-step Fix:**
  Run the script by temporarily bypassing execution policy for that specific process invocation:
  ```powershell
  powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 -Global
  ```
  This is completely safe and does NOT permanently change system security.
- **Recovery Path:** Use manual installation via File Explorer (see [docs/WINDOWS-GUIDE.md](WINDOWS-GUIDE.md)).

---

### 7. Missing WSL Component Error on Windows

- **Likely Cause:** Running `bash install.sh` in Windows CMD or PowerShell when WSL is not installed. Windows calls the stub `C:\Windows\System32\bash.exe`, which errors.
- **Verification Command:**
  Notice the error output:
  `This application requires the Windows Subsystem for Linux Optional Component.`
- **Step-by-step Fix:**
  1. Do NOT install WSL simply to copy skill files.
  2. Use the native PowerShell installer instead:
     ```powershell
     .\scripts\install.ps1 -Global
     ```
- **Recovery Path:** If PowerShell is unavailable, copy the skill folders manually via File Explorer into `%USERPROFILE%\.gemini\config\skills`.

---

### 8. Bash Command Not Recognized on Windows

- **Likely Cause:** Trying to run Linux bash commands in Windows Command Prompt without Git Bash or WSL installed.
- **Verification Command:**
  Output: `'bash' is not recognized as an internal or external command`.
- **Step-by-step Fix:**
  Switch from Command Prompt to PowerShell and use the `.ps1` script:
  ```powershell
  .\scripts\install.ps1 -Global
  ```
- **Recovery Path:** If you prefer Bash on Windows, open **Git Bash** (installed with Git for Windows) and run `bash scripts/install.sh --global`.

---

### 9. Destination Skill Already Exists

- **Likely Cause:** The installer detected an existing skill folder at the destination and skipped it to avoid overwriting your custom changes.
- **Verification Command:**
  The installer outputs:
  `[!] Skipped '<skill>': already exists at destination. Use -Force to overwrite.`
- **Step-by-step Fix:**
  - If you want to replace existing files with the toolkit's latest version, pass the `-Force` (or `--force`) flag:
    - Windows: `.\scripts\install.ps1 -Global -Force`
    - Linux/macOS: `bash scripts/install.sh --global --force`
- **Recovery Path:** Preview changes first with `-DryRun` / `--dry-run` to see what will be updated.

---

### 10. Incorrect Repository Root

- **Likely Cause:** Running the installer script from a different folder without passing correct paths.
- **Verification Command:**
  - Windows:
    ```powershell
    Test-Path ".\skills"
    ```
- **Step-by-step Fix:**
  Make sure your current terminal directory is the root of the cloned/extracted repository (the folder containing `README.md` and `skills/`):
  ```powershell
  Set-Location "C:\path\to\antigravity-skills"
  ```
- **Recovery Path:** The installer script automatically calculates its parent directory relative to its own location (`$PSScriptRoot`), so you can also run it via absolute path:
  `powershell -File "C:\path\to\antigravity-skills\scripts\install.ps1" -Global`

---

### 11. ZIP Extracted into a Nested Folder

- **Likely Cause:** Windows "Extract All" created a nested folder structure like `Downloads\antigravity-skills-main\antigravity-skills-main\`.
- **Verification Command:**
  Check if `Get-ChildItem` in your current folder only shows another folder with the same name.
- **Step-by-step Fix:**
  1. Open the folder in File Explorer.
  2. If you see a single inner folder with the same name, enter that inner folder.
  3. Verify that you see `README.md`, `LICENSE`, `skills/`, and `scripts/`.
  4. Run the installer from inside that folder.
- **Recovery Path:** Move the inner contents up one level or run:
  `Set-Location .\antigravity-skills-main`

---

### 12. Installer Reports Success but No Skill Appears

- **Likely Cause:** The skills were installed into workspace `.agents\skills`, but Antigravity is currently open in a different project root, or the window was not reloaded.
- **Verification Command:**
  Check where the files landed:
  - If installed to workspace: check `<project-root>\.agents\skills\`
  - If installed to global: check `%USERPROFILE%\.gemini\config\skills\`
- **Step-by-step Fix:**
  1. If you wanted the skills globally across all projects, install with `-Global`:
     `.\scripts\install.ps1 -Global -Force`
  2. Reload the Antigravity window (`Ctrl + Shift + P` -> `Developer: Reload Window`).
- **Recovery Path:** In Antigravity chat, explicitly ask: *"What skills do you have access to?"* or prompt with a specific skill trigger.

---

### 13. Existing Skill Content Differs from Repository

- **Likely Cause:** You made local modifications to a skill's instructions and re-running the installer may discard them.
- **Verification Command:**
  Compare your installed version with the repository version:
  - Windows PowerShell:
    ```powershell
    Compare-Object (Get-Content "$HOME\.gemini\config\skills\uiux-design-engine\SKILL.md") (Get-Content ".\skills\uiux-design-engine\SKILL.md")
    ```
- **Step-by-step Fix:**
  1. Backup your local skill before reinstalling:
     `Copy-Item "$HOME\.gemini\config\skills\uiux-design-engine" "$HOME\.gemini\config\skills\uiux-design-engine-custom" -Recurse`
  2. Then update with `-Force`.
- **Recovery Path:** Restore your custom backup folder if needed.

---

### 14. Antigravity Requires a Restart or Reload

- **Likely Cause:** Antigravity indexes skills at startup or workspace open. File changes on disk during an active session might not be reflected immediately in the model's system prompt context.
- **Verification Command:**
  Test if the model responds with the updated instructions.
- **Step-by-step Fix:**
  1. Open the IDE Command Palette (`Ctrl + Shift + P` on Windows/Linux, `Cmd + Shift + P` on macOS).
  2. Select **Developer: Reload Window**.
  3. If using Antigravity CLI or standalone app, exit and restart the session.
- **Recovery Path:** Close all running Antigravity IDE instances and re-open.

---

### 15. A Reference File Cannot Be Found

- **Likely Cause:** When installing `uiux-design-engine`, only `SKILL.md` was copied while the `references/` subfolder was omitted.
- **Verification Command:**
  - Windows:
    ```powershell
    Test-Path "$HOME\.gemini\config\skills\uiux-design-engine\references\design-intelligence.md"
    ```
  - Linux / macOS:
    ```bash
    test -f ~/.gemini/config/skills/uiux-design-engine/references/design-intelligence.md && echo "Found!"
    ```
- **Step-by-step Fix:**
  1. Always copy the entire skill directory (including `references/`), or use `install.ps1` / `install.sh` which automatically copies all subfolders recursively.
  2. Reinstall with `-Force`:
     ```powershell
     .\scripts\install.ps1 -Global -Force
     ```
- **Recovery Path:** Both reference files are also available at the root of this repository in `references/design-intelligence.md` and `references/ui-ux-field-guide.md`.
