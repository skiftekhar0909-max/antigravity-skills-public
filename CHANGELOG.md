# Changelog

All notable changes to the **Antigravity Skills Toolkit** will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.1.0] - 2026-10-03

### Added
- **Native Windows PowerShell Installer (`scripts/install.ps1`)**: Runs natively without requiring WSL, Git Bash, or Linux dependencies. Supports `-Global`, `-Workspace`, `-Skill <name>`, `-Force`, `-DryRun`, and `-List`.
- **PowerShell Uninstaller (`scripts/uninstall.ps1`)**: Safely removes toolkit skills while preserving user-created skills and external configurations.
- **Enhanced Unix/macOS Installer (`scripts/install.sh`)**: Features dynamic skill discovery, single-skill targeting (`--skill`), dry-run preview (`--dry-run`), and explicit path targeting (`--global`, `--workspace`, `--target`).
- **Unix/macOS Uninstaller (`scripts/uninstall.sh`)**: Symmetric uninstaller for Linux and macOS environments.
- **Top-level `references/` Directory**: Central repository references including `design-intelligence.md` and `ui-ux-field-guide.md` for fast browsing and reference across skills.
- **Comprehensive Documentation Suite (`docs/`)**:
  - `docs/INSTALLATION.md`: Central, in-depth installation guide covering manual and automated workflows.
  - `docs/WINDOWS-GUIDE.md`: Dedicated step-by-step Windows guide addressing PowerShell execution policies and WSL error resolution.
  - `docs/LINUX-MACOS-GUIDE.md`: Dedicated guide for Linux and macOS terminal workflows and file permissions.
  - `docs/TROUBLESHOOTING.md`: Detailed solutions for 15 common setup, discovery, syntax, and permission issues.
  - `docs/SKILL-AUTHORING.md`: Complete guide to authoring, structuring, and testing custom Antigravity skills.
- **Automated Repository Test Suite (`tests/validate_repository.py`)**: Standalone Python 3 validator checking skill frontmatter, naming uniqueness, directory matching, relative markdown links, and script safety without third-party dependencies.
- **Security Policy (`SECURITY.md`)**: Responsible disclosure instructions via GitHub Security Advisories and core security principles.
- **Environment Template (`.env.example`)**: Clean configuration template without secrets to adhere to repository hygiene standards.

### Changed
- Relocated installer scripts from the root directory into `scripts/` to maintain clean repository architecture.
- Updated default global installation target to the verified Antigravity directory: `~/.gemini/config/skills/` (and `%USERPROFILE%\.gemini\config\skills\` on Windows).
- Expanded `.gitignore` with comprehensive rules covering Python caches, virtual environments, editor state, build artifacts, and sensitive file patterns.
- Updated `skills/uiux-design-engine/SKILL.md` to reference both `design-intelligence.md` and `ui-ux-field-guide.md`.
- Completely rewrote `README.md` into an accessible, beginner-friendly public landing page with verified paths, copy-pasteable commands, and troubleshooting links.

### Removed
- Removed legacy root `install.sh` in favor of organized scripts in `scripts/`.

---

## [1.0.0] - 2026-10-03

### Added
- Initial repository release consolidating four foundational Antigravity skills:
  - `uiux-design-engine`: Interface design, motion principles, and accessibility audits.
  - `web-dev-architect`: End-to-end full-stack application scaffolding with strict zero-code-drop rules.
  - `code-optimizer-purifier`: Behavior-preserving refactoring and dead-code pruning.
  - `code-explainer-human`: Multi-level, jargon-free code explanations in English, Hinglish, and Hindi.
- Embedded reference documents for UI/UX design intelligence and field guide.
- Basic shell installer (`install.sh`) and initial repository documentation (`README.md`, `LICENSE`, `CONTRIBUTING.md`, `SOURCES.md`).
