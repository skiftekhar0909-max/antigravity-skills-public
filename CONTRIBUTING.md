# Contributing to Antigravity Skills Toolkit

Thank you for your interest in contributing to the **Antigravity Skills Toolkit**! We welcome community contributions, including new specialized skills, installer improvements, trigger refinements, and bug fixes.

---

## Code of Conduct & Core Standards

1. **Production Quality:** All skills must be production-ready with clear, actionable operational instructions—not generic advice or empty placeholders.
2. **Strict Privacy & Safety:** Never commit API keys, personal paths, private tokens, passwords, or client proprietary code.
3. **No Redundant Bloat:** Skills should have crisp triggers and rely on progressive disclosure via `references/` for bulky catalogues.
4. **Independent Rights:** Only submit material that you have authored or have confirmed rights to distribute under the repository's MIT License.

---

## How to Add or Update a Skill

1. **Review Authoring Guidelines:**
   Read [docs/SKILL-AUTHORING.md](docs/SKILL-AUTHORING.md) for detailed structural standards and frontmatter requirements.

2. **Create the Skill Folder:**
   Add your new skill under `skills/<skill-name>/` with a matching `SKILL.md`:
   ```text
   skills/my-new-skill/
   ├── SKILL.md
   └── references/ (optional)
   ```

3. **Frontmatter Standard:**
   Ensure `SKILL.md` begins with valid YAML frontmatter:
   ```markdown
   ---
   name: my-new-skill
   description: Trigger-rich description with positive triggers and negative triggers.
   ---
   ```
   The `name` field must match the directory name exactly.

4. **Preserve References:**
   If your skill refers to external guides, place them in `skills/<skill-name>/references/` or `references/` and use relative links.

---

## Verification & Testing

Before opening a pull request, run the automated test suite:

```bash
# Run the repository validation suite (requires Python 3.8+)
python tests/validate_repository.py
```

The validator verifies:
- All skills contain valid `SKILL.md` with correct YAML frontmatter.
- Skill names match directory names and are unique.
- Internal relative markdown links resolve to existing files.
- Installer scripts contain no hardcoded personal machine paths.
- Required repository and documentation files are present.

### Testing Installers
- **Windows PowerShell:**
  ```powershell
  powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 -DryRun
  powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 -List
  ```
- **Linux / macOS Bash:**
  ```bash
  bash scripts/install.sh --dry-run
  bash scripts/install.sh --list
  ```

---

## Submitting a Pull Request

1. Fork the repository and create your feature branch:
   ```bash
   git checkout -b feature/my-new-skill
   ```
2. Commit your changes with a descriptive commit message following [Conventional Commits](https://www.conventionalcommits.org/):
   ```bash
   git commit -m "feat(skills): add my-new-skill for automated database migrations"
   ```
3. Push to your branch and open a Pull Request.
4. Describe the problem your change solves, the triggers used, and how you validated the skill locally.
