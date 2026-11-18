# Issue

**Title:** Fix warnings raised in recent pytest versions

## Description

**Motivation and context:**

While these come up as warnings for me locally, it seems as though they can be raised as errors on TravisCI (see [this build](https://travis-ci.org/nengo/nengo/jobs/556416311)).

The only warnings not fixed are in third party packages or SPA. Since nengo.SPA is deprecated and will be removed in the future, we will ignore these warnings for now.

**Interactions with other PRs:**
#1387 is blocked until this is merged.

**How has this been tested?**
Ran the tests, saw that no warnings were raised.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `042fffe0b351`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.