# Issue

**Title:** Allow NumPy scalars for eval points

## Description

**Motivation and context:**
In #1677, we fixed a NumPy warning in which an array was being set with list, tuple, or other iterable. We fixed it by checking if it was a number or ndarray. We didn't consider NumPy scalar types, which NengoDL uses, and which fail when `np.hstack` is called on them.

This fixes that issue. Since the issue exists only in master and not in a release version, we don't need a changelog entry.

**How has this been tested?**
NengoDL tests pass with this.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aed588bb7c6d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.