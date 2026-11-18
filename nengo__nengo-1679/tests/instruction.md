# Issue

**Title:** Copy inputs for process step functions

## Description

**Motivation and context:**
While working on  we discovered that processes don't copy their input `x` value, even though they are copied for non-process node step functions. This PR copies the `x` value for processes as well, making them behave the same.

**How has this been tested?**
Tested that this PR makes the `np.copy` in  not necessary. However, we should probably write a test for this within NengoCore.

**How long should this take to review?**

- Average (neither quick nor lengthy)

**Where should a reviewer start?**
Should probably start by writing a test for the behavior. We might have a test that normal node output functions are copies which we can add a process to.

**Types of changes:**

- Bug fix (non-breaking change which fixes an issue)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

**Still to do:**
- [x] Add test

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `df0cfd1fa43a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.