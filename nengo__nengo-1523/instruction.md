# Issue

**Title:** Update copyright notices to 2019

## Description

**Motivation and context:**
Copyright notices in the code / license were 2017. This updates them to 2019.

**Interactions with other PRs:**
May experience conflicts in `__init__.py` after #1520.

**How has this been tested?**
Visual inspection.

**How long should this take to review?**
- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
- Non-code change (touches things like tests, documentation, build scripts)

**Checklist:**
- [x] I have read the **CONTRIBUTING.rst** document.
- [N/A] I have updated the documentation accordingly.
- [N/A] I have included a changelog entry.
- [N/A] I have added tests to cover my changes.
- [N/A] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `52bf2fe73208`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.