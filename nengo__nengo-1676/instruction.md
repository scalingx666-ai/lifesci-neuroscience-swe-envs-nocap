# Issue

**Title:** Fix some signals not correctly marked readonly

## Description

**Motivation and context:**
A user reported issues in resetting a simulator with recent versions of Nengo. The issue was that some signals were not marked readonly, but their underlying NumPy arrays were readonly. This PR fixes the case that was causing the issue for the user.

**How has this been tested?**
Existing tests still run, the user's model now resets correctly.

**How long should this take to review?**

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**

- Bug fix (non-breaking change which fixes an issue)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [na] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [na] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b216ef5fc315`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.