# Issue

**Title:** Raise BuildError if conn function returns None

## Description

**Motivation and context:**
In #1318 @ikajic reported that we don't raise a nice error if someone forgets to return a value from a connection function (which is a common thing to forget, especially when moving from a lambda to a named function). This raises a nice error when that happens.

**How has this been tested?**
Added a test that the error gets raised.

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

**Discussion points**

This error gets raised at build time, not a model creation time. This is because running a connection function might not be something the user expects when defining the model. It already gets run at build time, so this keeps the user's expectations the same. We could do this at model creation time though, if the consensus prefers that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `26f614e65fde`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.