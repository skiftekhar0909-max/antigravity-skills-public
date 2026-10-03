# Antigravity Skills Toolkit

> **A curated, production-ready collection of operational skills for Google Antigravity.**
> Supercharge your pair-programming AI agent with specialized runbooks for high-fidelity UI/UX design, full-stack application architecture, extreme code de-bloating, and human-friendly code translation.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform: Cross-Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-brightgreen.svg)](docs/INSTALLATION.md)
[![Status: Community-Maintained](https://img.shields.io/badge/Status-Community--Maintained-orange.svg)](CONTRIBUTING.md)

---

## What Is This?

In Google Antigravity, **Skills** are modular packages containing operational knowledge, triggers, and execution workflows. Instead of relying on generic AI advice, skills transform your agent into a disciplined domain expert with strict invariants, phased workflows, and zero-code-drop policies.

This repository provides **four foundational skills**, backed by extensive design catalogues, native cross-platform installers for Windows and Unix, and an automated verification test suite.

---

## Quick Start (Install in Under 60 Seconds)

### On Windows (Native PowerShell — No WSL Needed!)

Open PowerShell (`powershell.exe`) and run:

```powershell
# Navigate to this repository folder
Set-Location "$HOME\Downloads\antigravity-skills"

# Install all skills globally across all your projects
.\scripts\install.ps1 -Global
```

> **Blocked by Windows Execution Policy?** Run with bypass for this command:
> ```powershell
> powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 -Global
> ```

### On Linux & macOS (Terminal)

Open your terminal and run:

```bash
cd ~/Downloads/antigravity-skills
chmod +x scripts/install.sh scripts/uninstall.sh
bash scripts/install.sh --global
```

### Drag-and-Drop Manual Install (Zero Dependencies)

1. Download this repository as a ZIP using the green **Code** -> **Download ZIP** button above.
2. Extract the archive.
3. Open your Antigravity global skills folder:
   - **Windows:** Press `Win + R`, paste `%USERPROFILE%\.gemini\config\skills`, and press Enter.
   - **macOS / Linux:** Open `~/.gemini/config/skills/`.
4. Copy any skill folder from `skills/` (e.g., `uiux-design-engine`) into that directory.
5. Reload or restart Antigravity.

---

## Skills Included in the Toolkit

| Skill | Directory | Triggers & Use Cases | Key Invariants & Standards |
|---|---|---|---|
| **[UI/UX Design Engine](skills/uiux-design-engine/SKILL.md)** | [`skills/uiux-design-engine/`](skills/uiux-design-engine/SKILL.md) | *"make it look modern"*, *"design a landing page"*, *"give it a premium feel"*, *"improve visual design"*, *"design a card/modal"* | Zero generic output; WCAG 2.2 AA accessibility; 60fps micro-interactions; consults [Design Intelligence](references/design-intelligence.md) and [UI/UX Field Guide](references/ui-ux-field-guide.md). |
| **[Web Dev Architect](skills/web-dev-architect/SKILL.md)** | [`skills/web-dev-architect/`](skills/web-dev-architect/SKILL.md) | *"scaffold the project"*, *"set up Next.js App Router"*, *"wire up backend/auth"*, *"add database schema"*, *"make this production-ready"* | **Strict Zero-Code-Drop Policy**: No `// TODO`, no `// ...existing code...`, complete typed implementations with environment schemas. |
| **[Code Optimizer Purifier](skills/code-optimizer-purifier/SKILL.md)** | [`skills/code-optimizer-purifier/`](skills/code-optimizer-purifier/SKILL.md) | *"this file is too long"*, *"remove the junk AI wrote"*, *"clean up dead code"*, *"refactor for brevity"*, *"eliminate redundant state"* | **100% behavior preservation**; public API stability; no new abstractions or dependencies; measures lines removed vs touched. |
| **[Code Explainer Human](skills/code-explainer-human/SKILL.md)** | [`skills/code-explainer-human/`](skills/code-explainer-human/SKILL.md) | *"explain like I am not a dev"*, *"what does this file do"*, *"samjhao"*, *"simple words me batao"*, *"explain in Hinglish / Hindi"* | Zero jargon; real-world physical metaphors; multi-lingual (English, Hinglish, Hindi Devanagari); tailored for founders and beginners. |

---

## Reference Guides

This repository includes two deep reference documents located in [`references/`](references/):

1. **[`references/design-intelligence.md`](references/design-intelligence.md)**: A 1,300+ line catalogue detailing visual paradigms (Glassmorphism, Minimalist Mono, Bento Grids, Cyberpunk HUD), motion tokens, typography pairings, and domain-specific UI presets.
2. **[`references/ui-ux-field-guide.md`](references/ui-ux-field-guide.md)**: A comprehensive reference covering UX discovery, interaction heuristics (Nielsen's 10), information architecture, wireframing, and accessibility compliance.

---

## Installation Scenarios

### Global vs Workspace Installation

Google Antigravity supports two discovery scopes:

- **Global Scope (`-Global` / `--global`):**
  - **Windows:** `%USERPROFILE%\.gemini\config\skills\`
  - **Linux / macOS:** `~/.gemini/config/skills/`
  - *Best for:* Making skills available across all current and future projects on your machine.
- **Workspace Scope (`-Workspace` / `--workspace`):**
  - **Path:** `<project-root>/.agents/skills/` (or `.agent/skills/`)
  - *Best for:* Sharing specific skills with your engineering team via Git.

### Installing a Single Skill

You can install only the specific skills you need:

**Windows PowerShell:**
```powershell
# Install only UI/UX Design Engine
.\scripts\install.ps1 -Global -Skill uiux-design-engine

# Install two specific skills
.\scripts\install.ps1 -Global -Skill uiux-design-engine, web-dev-architect
```

**Linux / macOS Bash:**
```bash
# Install only UI/UX Design Engine
bash scripts/install.sh --global --skill uiux-design-engine

# Install two specific skills
bash scripts/install.sh --global --skill uiux-design-engine --skill web-dev-architect
```

### Previewing Installation (Dry-Run)

Preview what will be installed or skipped without modifying any files:

- **Windows:** `.\scripts\install.ps1 -Global -DryRun`
- **Unix:** `bash scripts/install.sh --global --dry-run`

### Updating Existing Skills

If you have updated this repository or pulled new commits:

- **Windows:** `.\scripts\install.ps1 -Global -Force`
- **Unix:** `bash scripts/install.sh --global --force`

---

## How to Verify That a Skill Works

1. **Verify Files on Disk:**
   - **Windows:** Run `Get-ChildItem "$HOME\.gemini\config\skills"`
   - **Linux / macOS:** Run `ls -la ~/.gemini/config/skills`
   Ensure your skill folders (`uiux-design-engine`, etc.) appear with `SKILL.md` inside.

2. **Reload Antigravity:**
   In your Antigravity IDE, press `Ctrl + Shift + P` (or `Cmd + Shift + P` on macOS) and run:
   `Developer: Reload Window`

3. **Prompt the Agent:**
   Test with an explicit trigger query in chat:
   - *"Design a clean modern SaaS navbar with dark mode support."* (Activates `uiux-design-engine`)
   - *"Audit this component and remove any redundant state."* (Activates `code-optimizer-purifier`)
   - *"Explain how this backend authentication route works in simple Hinglish."* (Activates `code-explainer-human`)

---

## Uninstallation

We provide dedicated uninstallers that safely remove only toolkit skills without deleting your other personal or custom skills:

**Windows PowerShell:**
```powershell
# Preview what would be removed
.\scripts\uninstall.ps1 -Global -All -DryRun

# Remove all toolkit skills globally
.\scripts\uninstall.ps1 -Global -All

# Remove only one specific skill
.\scripts\uninstall.ps1 -Global -Skill uiux-design-engine
```

**Linux / macOS Bash:**
```bash
# Remove all toolkit skills globally
bash scripts/uninstall.sh --global --all

# Remove only one specific skill
bash scripts/uninstall.sh --global --skill uiux-design-engine
```

---

## Documentation & Deep Guides

- **[Installation Guide](docs/INSTALLATION.md):** Complete installation manual covering manual and automated workflows.
- **[Windows Guide](docs/WINDOWS-GUIDE.md):** Dedicated Windows setup, PowerShell execution policy tips, and resolving WSL issues.
- **[Linux & macOS Guide](docs/LINUX-MACOS-GUIDE.md):** Terminal workflow and permission management.
- **[Troubleshooting Guide](docs/TROUBLESHOOTING.md):** Solutions for 15 common discovery, path, and syntax errors.
- **[Skill Authoring Guide](docs/SKILL-AUTHORING.md):** How to create, structure, and test your own Antigravity skills.
- **[Attribution & Sources](SOURCES.md):** Source archive records and assembly history.

---

## Automated Validation Test Suite

This repository includes a standalone test suite in Python (standard library only, zero pip dependencies):

```bash
python tests/validate_repository.py
```

The test suite validates:
- [x] Every skill directory contains `SKILL.md`.
- [x] All frontmatter conforms to YAML specifications (`name`, `description`).
- [x] Directory names match skill `name` fields.
- [x] Skill names are globally unique.
- [x] All internal relative markdown links resolve to real files.
- [x] No hardcoded personal or machine-specific paths exist in scripts.
- [x] Security and `.gitignore` rules prevent credential leakage.

---

## Security

Please review [SECURITY.md](SECURITY.md) for our vulnerability disclosure policy.

- **No Secrets:** Never commit real API keys, passwords, or tokens. Use [`.env.example`](.env.example) as a placeholder guide.
- **Safe Scripts:** Installers operate strictly on designated skill folders without modifying system configuration or installing global software.

---

## Contributing

Contributions are warmly welcomed! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for instructions on creating skills, formatting frontmatter, and submitting pull requests.

---

## License & Community Disclaimer

This repository is distributed under the [MIT License](LICENSE).

> **Disclaimer:** This project is an independent, community-driven resource and is **not** an official Google product. "Google Antigravity" is referenced solely to indicate technical compatibility and intended use.
