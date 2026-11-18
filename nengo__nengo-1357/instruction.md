# Issue

**Title:** Raise an error if sim is run for < dt seconds

## Description

**Motivation and context:**
If you pass a number less than `dt` to `sim.run`, we might raise a `ZeroDivisionError` or we might do something even weirder; . This raises an explicit error if `sim.run` is called with a value less than `dt`.

**How has this been tested?**
A unit test is included.

**How long should this take to review?**

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**

- Bug fix (non-breaking change which fixes an issue)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] All new and existing tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9193f704655e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.