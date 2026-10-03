#!/usr/bin/env python3
"""
Antigravity Skills Toolkit - Repository Validation Suite
=========================================================
Validates the repository structure, YAML frontmatter of skills,
relative markdown links, installer paths, and security hygiene.

Requires: Python 3.8+ (Standard Library only - no pip dependencies needed).
Usage:
    python tests/validate_repository.py
"""

import os
import re
import sys
from pathlib import Path
from urllib.parse import unquote

# Color output helpers (works in Windows Terminal, PowerShell, and Unix)
GREEN = "\033[92m"
RED = "\033[91m"
YELLOW = "\033[93m"
CYAN = "\033[96m"
BOLD = "\033[1m"
RESET = "\033[0m"


class ValidationSuite:
    def __init__(self, root_dir: Path):
        self.root = root_dir
        self.passed = 0
        self.failed = 0
        self.warnings = 0
        self.errors = []

    def assert_test(self, condition: bool, test_name: str, error_msg: str = ""):
        if condition:
            self.passed += 1
            print(f"  {GREEN}[PASS]{RESET} {test_name}")
        else:
            self.failed += 1
            msg = f"{test_name} -> {error_msg}" if error_msg else test_name
            self.errors.append(msg)
            print(f"  {RED}[FAIL]{RESET} {test_name}")
            if error_msg:
                print(f"         {RED}Error: {error_msg}{RESET}")

    def warn(self, test_name: str, warn_msg: str):
        self.warnings += 1
        print(f"  {YELLOW}[WARN]{RESET} {test_name}: {warn_msg}")

    def validate_core_files(self):
        print(f"\n{BOLD}{CYAN}1. Validating Core Repository Structure & Documentation{RESET}")
        required_files = [
            "README.md",
            "LICENSE",
            "CONTRIBUTING.md",
            "SECURITY.md",
            "CHANGELOG.md",
            "SOURCES.md",
            ".gitignore",
            ".env.example",
            "docs/INSTALLATION.md",
            "docs/WINDOWS-GUIDE.md",
            "docs/LINUX-MACOS-GUIDE.md",
            "docs/TROUBLESHOOTING.md",
            "docs/SKILL-AUTHORING.md",
            "scripts/install.ps1",
            "scripts/install.sh",
            "scripts/uninstall.ps1",
            "scripts/uninstall.sh",
            "references/design-intelligence.md",
            "references/ui-ux-field-guide.md",
        ]

        for rel_path in required_files:
            file_path = self.root / rel_path
            self.assert_test(
                file_path.is_file(),
                f"Required file exists: {rel_path}",
                f"File not found at {file_path}",
            )

    def validate_skills(self):
        print(f"\n{BOLD}{CYAN}2. Validating Skills & Frontmatter Specification{RESET}")
        skills_dir = self.root / "skills"
        self.assert_test(skills_dir.is_dir(), "Skills directory exists", f"{skills_dir} is not a directory")
        if not skills_dir.is_dir():
            return

        skill_dirs = [d for d in skills_dir.iterdir() if d.is_dir()]
        self.assert_test(len(skill_dirs) > 0, "Discovered at least one skill", "No skill folders found")

        seen_names = set()

        for s_dir in sorted(skill_dirs):
            skill_md = s_dir / "SKILL.md"
            self.assert_test(
                skill_md.is_file(),
                f"Skill '{s_dir.name}' contains SKILL.md",
                f"Missing SKILL.md in {s_dir}",
            )
            if not skill_md.is_file():
                continue

            content = skill_md.read_text(encoding="utf-8")
            
            # Validate YAML Frontmatter
            frontmatter_match = re.match(r"^---\r?\n(.*?)\r?\n---", content, re.DOTALL)
            self.assert_test(
                bool(frontmatter_match),
                f"Skill '{s_dir.name}' has valid YAML frontmatter delimiters (---)",
                "Frontmatter missing or improperly formatted",
            )
            if not frontmatter_match:
                continue

            fm_text = frontmatter_match.group(1)
            
            # Extract name and description
            name_match = re.search(r"^name:\s*([a-zA-Z0-9_-]+)", fm_text, re.MULTILINE)
            desc_match = re.search(r"^description:\s*(.+)$", fm_text, re.MULTILINE)

            self.assert_test(
                bool(name_match),
                f"Skill '{s_dir.name}' frontmatter contains 'name'",
                "No valid 'name:' found in frontmatter",
            )
            self.assert_test(
                bool(desc_match),
                f"Skill '{s_dir.name}' frontmatter contains 'description'",
                "No valid 'description:' found in frontmatter",
            )

            if name_match:
                parsed_name = name_match.group(1).strip()
                self.assert_test(
                    parsed_name == s_dir.name,
                    f"Skill directory '{s_dir.name}' matches frontmatter name '{parsed_name}'",
                    f"Mismatch: directory is '{s_dir.name}' but frontmatter name is '{parsed_name}'",
                )
                self.assert_test(
                    parsed_name not in seen_names,
                    f"Skill name '{parsed_name}' is globally unique",
                    f"Duplicate skill name detected: {parsed_name}",
                )
                seen_names.add(parsed_name)

            if desc_match:
                desc_text = desc_match.group(1).strip()
                self.assert_test(
                    len(desc_text) >= 40,
                    f"Skill '{s_dir.name}' description is trigger-rich ({len(desc_text)} chars)",
                    f"Description is too short ({len(desc_text)} chars). Should be trigger-rich.",
                )

    def validate_relative_links(self):
        print(f"\n{BOLD}{CYAN}3. Validating Markdown Relative Links{RESET}")
        md_files = list(self.root.glob("*.md")) + list(self.root.glob("docs/*.md"))
        for s in (self.root / "skills").glob("*/SKILL.md"):
            md_files.append(s)

        link_pattern = re.compile(r"(?<!`)\[([^\]]+)\]\(([^)]+)\)")
        broken_count = 0

        for md_path in md_files:
            text = md_path.read_text(encoding="utf-8")
            # Strip out fenced code blocks so code examples are not checked as real links
            text_without_codeblocks = re.sub(r"```[\s\S]*?```", "", text)
            rel_file = md_path.relative_to(self.root)
            
            for match in link_pattern.finditer(text_without_codeblocks):
                link_text, link_target = match.group(1), match.group(2).strip()

                # Skip web links, anchors, mailto
                if (
                    link_target.startswith("http://")
                    or link_target.startswith("https://")
                    or link_target.startswith("mailto:")
                    or link_target.startswith("#")
                ):
                    continue

                # Strip anchor fragment
                target_path_str = link_target.split("#")[0].strip()
                if not target_path_str:
                    continue

                target_path_str = unquote(target_path_str)

                # Resolve target relative to the containing md file
                resolved_target = (md_path.parent / target_path_str).resolve()
                
                # Verify existence
                exists = resolved_target.exists()
                self.assert_test(
                    exists,
                    f"Link in {rel_file}: '{link_target}' resolves",
                    f"Broken link in {rel_file}: '{link_target}' -> {resolved_target} not found",
                )
                if not exists:
                    broken_count += 1

        if broken_count == 0:
            print(f"  {GREEN}[INFO]{RESET} All internal markdown relative links resolved successfully.")

    def validate_scripts_hygiene(self):
        print(f"\n{BOLD}{CYAN}4. Validating Script Hygiene & Safe Portability{RESET}")
        script_files = [
            self.root / "scripts/install.ps1",
            self.root / "scripts/install.sh",
            self.root / "scripts/uninstall.ps1",
            self.root / "scripts/uninstall.sh",
        ]

        forbidden_patterns = [
            (re.compile(r"[C-Zc-z]:\\Users\\[a-zA-Z0-9_-]+", re.IGNORECASE), "Hardcoded Windows user directory"),
            (re.compile(r"/home/[a-zA-Z0-9_-]+", re.IGNORECASE), "Hardcoded Linux home directory"),
        ]

        for s_path in script_files:
            rel = s_path.relative_to(self.root)
            content = s_path.read_text(encoding="utf-8")

            # Check for non-empty
            self.assert_test(len(content) > 100, f"Script {rel} has substantial content", "Script is suspiciously short")

            # Check for hardcoded paths
            for pat, desc in forbidden_patterns:
                match = pat.search(content)
                matched_val = match.group(0) if match else ""
                self.assert_test(
                    not match,
                    f"Script {rel} has no {desc.lower()}",
                    f"Found forbidden match: '{matched_val}'",
                )

        # Ensure no legacy root install.sh remains
        legacy_install = self.root / "install.sh"
        self.assert_test(
            not legacy_install.exists(),
            "Legacy root 'install.sh' removed (scripts organized under 'scripts/')",
            "Root install.sh still exists; should be moved to scripts/install.sh",
        )

    def validate_security_and_secrets(self):
        print(f"\n{BOLD}{CYAN}5. Validating Security & Environment Hygiene{RESET}")
        # Verify .gitignore content
        gitignore_path = self.root / ".gitignore"
        self.assert_test(gitignore_path.is_file(), ".gitignore exists", ".gitignore missing")
        if gitignore_path.is_file():
            gi_content = gitignore_path.read_text(encoding="utf-8")
            required_ignores = [".env", "*.pem", "*.key", "node_modules/", "__pycache__/"]
            for req in required_ignores:
                self.assert_test(
                    req in gi_content,
                    f".gitignore contains '{req}'",
                    f"Missing recommended ignore rule: '{req}'",
                )

        # Verify .env.example
        env_example_path = self.root / ".env.example"
        self.assert_test(env_example_path.is_file(), ".env.example exists", ".env.example missing")
        if env_example_path.is_file():
            env_content = env_example_path.read_text(encoding="utf-8")
            # Ensure no obvious secret assignments
            suspicious_assignment = re.search(r"^[A-Z0-9_]+=[a-zA-Z0-9_\-]{16,}", env_content, re.MULTILINE)
            self.assert_test(
                not suspicious_assignment,
                ".env.example contains placeholders only (no embedded secret values)",
                f"Suspicious value found: {suspicious_assignment.group(0) if suspicious_assignment else ''}",
            )

    def run_all(self):
        print(f"\n{BOLD}=========================================================={RESET}")
        print(f"{BOLD}    Antigravity Skills Toolkit - Repository Test Suite    {RESET}")
        print(f"{BOLD}=========================================================={RESET}")
        print(f"Repository Root: {self.root}")

        self.validate_core_files()
        self.validate_skills()
        self.validate_relative_links()
        self.validate_scripts_hygiene()
        self.validate_security_and_secrets()

        print(f"\n{BOLD}=========================================================={RESET}")
        print(f"{BOLD}                    Test Summary Report                   {RESET}")
        print(f"{BOLD}=========================================================={RESET}")
        print(f"  {GREEN}Passed   : {self.passed}{RESET}")
        print(f"  {RED}Failed   : {self.failed}{RESET}")
        print(f"  {YELLOW}Warnings : {self.warnings}{RESET}")

        if self.failed > 0:
            print(f"\n{RED}{BOLD}Failed Tests:{RESET}")
            for err in self.errors:
                print(f"  * {err}")
            print(f"\n{RED}Validation FAILED with {self.failed} error(s).{RESET}\n")
            return 1
        else:
            print(f"\n{GREEN}{BOLD}Validation PASSED: All checks completed successfully!{RESET}\n")
            return 0


if __name__ == "__main__":
    repo_root = Path(__file__).resolve().parent.parent
    suite = ValidationSuite(repo_root)
    sys.exit(suite.run_all())
