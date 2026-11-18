# Issue

**Title:** minor bug fix get_structure_terminal_nodes

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
During writing of tests I noticed `get_structure_terminal_nodes` had unreachable code due to was incorrectly including the parent region in sub_region_ids when it does not have any "leaves".

**What does this PR do?**
Only includes (sub)region ids are now included in`sub_region_ids` that are not the same as the parent region id.

## References
#541 box 5

## How has this PR been tested?
#543  remove xfailmarker from `test_get_structure_terminal_nodes_without_leaves` after merging this PR.

## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b66e142c1006`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.