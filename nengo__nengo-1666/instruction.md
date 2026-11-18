# Issue

**Title:** Relax NumPy version check

## Description

**Motivation and context:**
I'm using a dev version of NumPy and wasn't able to import Nengo. Turned out we were casting `np.__version__.split(".")` to ints, which causes an error when using a development version of NumPy.

**How has this been tested?**
Able to import Nengo now.

**How long should this take to review?**

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**

- Bug fix (non-breaking change which fixes an issue)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [na] I have updated the documentation accordingly.
- [na] I have included a changelog entry.
- [na] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `529dd49294c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.