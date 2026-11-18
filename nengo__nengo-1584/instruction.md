# Issue

**Title:** Fix pickling

## Description

**Motivation and context:**
I was working on a very big SPA model that took over an hour to build, so I wanted to pickle the model to save that time. Found a few bugs in the pickling/unpickling process that prevented that.

Note that the model needed `dill` to properly pickle/unpickle, but I believe that was due to certain node functions using closure variables.

**How has this been tested?**
Was able to pickle/unpickle the model I was working on successfully.

**How long should this take to review?**

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**

- Bug fix (non-breaking change which fixes an issue)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [ ] I have updated the documentation accordingly.
- [ ] I have included a changelog entry.
- [ ] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

**Still to do:**
- [ ] Changelog entry
- [ ] Add tests

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ca422652b5e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.