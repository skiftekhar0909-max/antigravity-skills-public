# Antigravity Skills Toolkit

A community-oriented collection of reusable skills for Google Antigravity. The pack combines focused instructions for UI/UX design, web application architecture, code cleanup, and beginner-friendly code explanations, with additional UI/UX reference material.

> **Status:** Community-maintained starter pack. Review each skill and test it in a non-critical project before relying on its output.

## Skills included

| Skill | Folder | Use it for |
|---|---|---|
| UI/UX Design Engine | `skills/uiux-design-engine/` | Interface design, responsive layouts, design systems, motion, accessibility, and visual QA |
| Web Development Architect | `skills/web-dev-architect/` | Project structure, frontend/backend architecture, implementation planning, and production-readiness checks |
| Code Optimizer & Purifier | `skills/code-optimizer-purifier/` | Behavior-preserving refactors, dead-code cleanup, and reducing unnecessary complexity |
| Human-Friendly Code Explainer | `skills/code-explainer-human/` | Explaining code clearly for beginners, including English and Hinglish-style explanations |

The UI/UX skill includes two Markdown references under `skills/uiux-design-engine/references/`: a design-intelligence catalogue and a broader UI/UX field guide.

## Quick start

### Option A — Install into the current project

1. Download or clone this repository.
2. Open a terminal in your application project's root directory.
3. Run the installer from the downloaded repository:

   ```bash
   bash /path/to/antigravity-skills/install.sh
   ```

   Replace `/path/to/antigravity-skills` with the actual extracted or cloned path.

The installer copies the skill folders into `.agent/skills/` in the current project.

### Option B — Install globally

```bash
bash /path/to/antigravity-skills/install.sh --global
```

The default global destination is `~/.gemini/antigravity/skills/`.

### Option C — Choose a destination

```bash
bash /path/to/antigravity-skills/install.sh --target "/path/to/skills"
```

### Windows

Use Git Bash or WSL to run `install.sh`, or manually copy the desired skill folder(s) into the relevant Antigravity skills directory. For workspace installation, the repository's intended destination is `<project-root>/.agent/skills/`. For global installation, the default is `%USERPROFILE%\.gemini\antigravity\skills\`.

After installing, reload or restart Antigravity if the new skills are not detected.

## Install a single skill manually

Copy just one folder, for example `skills/uiux-design-engine/`, into your project's `.agent/skills/` directory. Keep the skill folder name and its `SKILL.md` file together. Preserve the `references/` subfolder for the UI/UX skill because its instructions may refer to those documents.

## Safety and quality notes

- Read a skill's `SKILL.md` before enabling it in an important project.
- Back up local customizations before installing. The installer may overwrite files with matching names inside a skill folder, but it does not delete unrelated skill folders.
- Review generated code. Run your project's tests, linting, type checks, and production build before shipping changes.
- Never place API keys, passwords, `.env` files, private client data, or proprietary project files in this repository.
- Antigravity versions and skill discovery behavior can change; if installation does not work, check the current official Antigravity documentation and adjust the destination accordingly.

## Contributing

Contributions are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request. Suggested contributions include clearer triggers, more precise instructions, tested examples, installation fixes, and corrections to the reference material.

## License and source review

This repository is intended to be published under the MIT License; see [LICENSE](LICENSE). Before publishing, the maintainer must confirm they have the right to redistribute and relicense every included skill and reference document. The source archives may contain material with separate licensing or attribution requirements. If permission is unclear, remove or replace that material before making the repository public.

## Disclaimer

This project is an independent community resource and is not an official Google product. “Google Antigravity” is used only to describe compatibility and intended use.
