# Antigravity Skill Authoring Guide

This guide explains how to design, write, test, and package custom skills for Google Antigravity.

---

## 1. Skill Philosophy

In Google Antigravity, a **Skill** is not generic coding advice—it is an **executable operational runbook** and cheatsheet.

Skills operate under **progressive disclosure**:
1. When Antigravity starts, it only indexes the **name** and **description** of each skill into the model's system prompt context.
2. The agent reads the description to decide whether to activate the skill for the user's prompt.
3. Only upon activation is the full content of `SKILL.md` loaded into the conversation context window.

This mechanism ensures high token efficiency while enabling deep, specialized expertise on demand.

---

## 2. Directory Structure

A skill must be organized as a directory inside a supported skills folder (such as `.agents/skills/<skill-name>/` or `~/.gemini/config/skills/<skill-name>/`):

```text
skills/<skill-name>/
├── SKILL.md            # [REQUIRED] Main instruction file with YAML frontmatter
├── references/         # [OPTIONAL] Deep reference manuals, cheat sheets, style catalogues
├── scripts/            # [OPTIONAL] Helper scripts or automation utilities
├── examples/           # [OPTIONAL] Canonical code examples or templates
└── resources/          # [OPTIONAL] Static assets, schemas, or prompt templates
```

### Critical Rules
- The directory name must match the frontmatter `name` exactly (e.g. directory `uiux-design-engine` has frontmatter `name: uiux-design-engine`).
- `SKILL.md` must be capitalized and located at the root of the skill directory.

---

## 3. YAML Frontmatter Specification

Every `SKILL.md` MUST begin with a YAML frontmatter block enclosed by triple dashes (`---`).

```markdown
---
name: my-custom-skill
description: High-density, trigger-rich description explaining what the skill does, when it should activate, and what it handles. Include negative triggers. Do NOT activate for unrelated tasks — use other skills instead.
---
```

### Frontmatter Fields

| Field | Type | Required | Description |
|---|---|---|---|
| `name` | string | **Yes** | Unique identifier using only lowercase letters, digits, and hyphens (`[a-z0-9-]+`). Must match the directory name. |
| `description` | string | **Yes** | The primary decision text read by Antigravity to route requests. |

### Engineering Effective Descriptions

The `description` is the most critical part of your skill. To make activation reliable:
1. **Trigger Keywords:** Include common phrases users type (e.g., *"clean this up"*, *"explain in plain words"*, *"design a modern landing page"*).
2. **Clear Purpose:** Clearly define the domain and scope.
3. **Negative Triggers:** Explicitly state when NOT to activate (e.g., *"Do NOT activate for backend architecture or code explanation"*).
4. **Third-Person Tone:** Describe the agent's role (e.g., *"Principal full-stack architect for..."*).

---

## 4. Structuring the `SKILL.md` Content

A well-crafted skill should read like an expert operational playbook. Structure your instructions into clear, logical sections:

### Section 1: Mission & Role
Define the agent's persona and primary success metric:
```markdown
# My Custom Skill — Title

## 1. Mission
State clearly what the agent's goal is and how success is measured.
```

### Section 2: Activation Protocol & Triggers
Define explicit conditions and boundary checks:
```markdown
## 2. Activation Protocol
Activate when:
- Condition A
- Condition B
Do NOT activate for:
- Negative condition X
```

### Section 3: Hard Invariants (Never Violate)
List non-negotiable rules the agent must respect:
- Behavior preservation
- Public API stability
- Zero secret disclosure
- No phantom imports or truncated code blocks

### Section 4: Phased Execution Workflow
Provide a step-by-step procedure:
- **Phase 0 — Context & Baseline:** What files to inspect first.
- **Phase 1 — Plan & Strategy:** How to approach the solution.
- **Phase 2 — Implementation:** Specific rules for code or design generation.
- **Phase 3 — Validation & QA:** How to verify that the change works.

### Section 5: Error Handling & Recovery
Explain how to recover gracefully when assumptions fail, tools error, or conflicts arise.

---

## 5. Using References for Progressive Disclosure

If your skill involves lengthy documentation, design system tokens, or multi-page guides, **do not paste everything into `SKILL.md`**.

Instead:
1. Place large reference documents in the skill's `references/` subdirectory (e.g. `references/my-guide.md`).
2. Link to them from `SKILL.md`:
   ```markdown
   Consult [my-guide.md](references/my-guide.md) for full token specifications.
   ```
3. The agent will read the reference file only when necessary, keeping the base context clean.

---

## 6. Validating Your Skill

Before submitting or publishing your skill, run the repository validator:

```bash
python tests/validate_repository.py
```

The validator verifies:
- Frontmatter presence and syntax.
- Consistency between directory name and frontmatter `name`.
- Uniqueness across all repository skills.
- Trigger richness of the description.
- Relative links resolve to actual files.

---

## 7. Skill Template Checklist

Use this checklist before sharing:
- [ ] Directory name is lowercase with hyphens (`skills/my-skill-name/`).
- [ ] `SKILL.md` exists and starts on line 1 with `---`.
- [ ] `name:` matches the directory name.
- [ ] `description:` contains concrete triggers and negative triggers.
- [ ] Instructions contain ordered, actionable phases.
- [ ] No hardcoded personal paths or API keys exist.
- [ ] References and links resolve properly.
- [ ] Tested locally with `python tests/validate_repository.py`.
