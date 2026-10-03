# Security Policy

## Supported Versions

The following versions of the Antigravity Skills Toolkit currently receive security updates:

| Version | Supported          |
| ------- | ------------------ |
| 1.1.x   | :white_check_mark: |
| < 1.1   | :x:                |

---

## Reporting a Vulnerability

We take the security of our skills, installers, and community workflows seriously. If you discover a vulnerability or security risk (such as prompt injection vectors, insecure shell script execution, or accidental credential leakage), please report it responsibly.

### Responsible Disclosure Process

1. **Do not open a public issue.** Please do NOT discuss vulnerabilities in public GitHub issues, discussions, or social media until a fix has been released.
2. **Submit a Private Vulnerability Report via GitHub:**
   - Navigate to the repository's [Security Advisories](https://github.com/skiftekhar0909-max/antigravity-skills-public/security/advisories).
   - Click **Report a vulnerability** to open a confidential report directly to repository maintainers.
3. **What to Include:**
   - A clear description of the vulnerability.
   - Exact steps or minimal reproducer to trigger the issue.
   - Any potential impact on users or environments.
   - Your recommendation or suggested remediation if available.

### Response Timeline

- **Acknowledgment:** Within 48 hours of report receipt.
- **Assessment & Triage:** Within 5 business days.
- **Fix & Public Advisory:** Coordinated release once remediation is tested and verified.

---

## Security Principles in This Repository

1. **Zero Secret Storage:**
   - No API keys, passwords, private tokens, or confidential environment variables are ever stored in skill files, scripts, or commit history.
   - All installers validate that only safe markdown and script assets are copied.

2. **No Unprompted Global Modifications:**
   - Installation scripts only copy skill folders to designated Antigravity directories (`.agents/skills` or `~/.gemini/config/skills`).
   - Installers do not modify system PATH, install software globally, or execute arbitrary remote binaries.

3. **Safe Script Execution on Windows:**
   - The Windows installer is a native PowerShell script (`install.ps1`). It avoids running opaque shell stubs or requiring privileged administrative elevation.
   - We recommend using narrowly scoped execution policy flags (such as `-ExecutionPolicy Bypass -File .\scripts\install.ps1`) rather than permanently altering system-wide execution policies.

4. **Prompt Safety & Boundaries:**
   - Skills include explicit boundary rules and non-negotiable invariants (such as behavioral preservation, public API stability, and zero-code-drop rules) to prevent destructive AI agent behavior.
