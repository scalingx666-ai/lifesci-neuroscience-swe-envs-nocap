# Issue

**Title:** Fix Connection transform validation

## Description

It should raise an error if `transform=None` (since `optional=False`), but it wasn't because it was being cast to `np.array(None)`.

**How has this been tested?**
Added a new test, existing tests pass.

**How long should this take to review?**
- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
<!--- What types of changes does your code introduce? -->
<!--- Leave all lines that apply below: -->

- Bug fix (non-breaking change which fixes an issue)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [x] I have read the **CONTRIBUTING.rst** document.
- [n/a] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] All new and existing tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b542a4864aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.