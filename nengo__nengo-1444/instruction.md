# Issue

**Title:** Fix iterating over Mock objects

## Description

**Motivation and context:**
As reported in #1441, previously if you tried to iterate over an object that was mocked out (e.g., something in `plt`) it would loop forever. This fixes it by returning a iterator to an empty list, so no iteration will occur.

Since this is a change only to testing infrastructure, I think it doesn't need a changelog entry as it's entirely an under-the-hood change.

**How has this been tested?**
Added a test, which will fail without the change to `Mock`.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `406766015050`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.