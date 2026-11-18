# Issue

**Title:** Add warning for invalid Node return types

## Description

**Motivation and context:**
Solves #1370. Not sure if this needs a changelog entry or not.

**How has this been tested?**
Ran the code in #1370 and it returned a legible error. Also ran all tests. Didn't add a unit test, because `operators.py` isn't tested?

**How long should this take to review?**
- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
- New feature (non-breaking change which adds functionality)

**Checklist:**
- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have included a changelog entry.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24b730cb192b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.