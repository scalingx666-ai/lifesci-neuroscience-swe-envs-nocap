# Issue

**Title:** Guard against zero-length encoders

## Description

**Motivation and context:**
Having NaN scaled encoders does not give a great error message.  for more details.

**How has this been tested?**
Added a few tests to ensure that the right error messages are being raised. The only thing not explicitly tested is that the check in the `DotIncMerger` succeeds if there are NaNs, but that situation should not be possible after the changes in this PR, so testing it seemed like overkill.

**How long should this take to review?**

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**

- Bug fix (non-breaking change which fixes an issue)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `09878429bdc7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.