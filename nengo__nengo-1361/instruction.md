# Issue

**Title:** Fixes bug where multiple identical indexed slices are ignored

## Description

**Motivation and context:**
As per  we have a bug where advanced indexing works when the indices are different but does not work when same index repeats multiple times. Eric found the api .at(), and I use it to fix the bug. 

**How has this been tested?**
I added a test *test_set_weight_solver* in *tests/test_connection.py*.

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
- [x] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [ ] All new and existing tests passed.

**Still to do:**

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `51ff3ede56b6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.