# Issue

**Title:** Fix test for ensemble tuning curves (numpy 1.13 compatibility)

## Description

The test was actually broken, but the error was hidden by a deprecation warning.  But that warning becomes an error in numpy 1.13, so we need to fix this for compatibility.

It might be good to make a bugfix release with this soonish, as right now if you do a fresh install of `nengo` it comes with `numpy` 1.13, and the unit tests don't pass.

Also, if we wanted to drop support for any old numpy versions, now might be a good time to do it.

**How has this been tested?**
Fixed one unit tests, and updated travis-ci tests to include numpy 1.13.

**How long should this take to review?**
- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
- Bug fix (non-breaking change which fixes an issue)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [ ] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] All new and existing tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `642280fc4600`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.