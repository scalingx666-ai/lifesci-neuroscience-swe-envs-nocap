# Issue

**Title:** Fix example testing

## Description

**Motivation and context:**
In #1349 we moved the examples to the docs directly. We forgot to tell our tests about that! This PR points the tests to the new example location.

**How has this been tested?**
Ran the tests locally; 1048 tests collected here compared to 915 without this PR.

**How long should this take to review?**

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**

- Bug fix (non-breaking change which fixes an issue)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [na] I have updated the documentation accordingly.
- [na] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94e152afcba1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.