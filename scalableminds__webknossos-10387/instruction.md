# Issue

**Title:** Fix node creation undo via storing relevant parts of LocalSkeletonState in the undo step as well

## Description

### Summary
Fixes the  bug. In short: The LocalSkeletonState relevant infos were not restored on undo/redo. Therefore, the bug existed. Now this included in the undo stack and undo action fixing the bug at its root cause.

Note, I added a single regression test to still cover this scenario but not multiple tests to keep the test suit lean.

### Steps to test:
on master the bug can be triggered via:
1. create 2 trees with each some nodes
2. create at least one new node for tree 1
3. then activeate tree 2 and create a new node there
4. undo till the newly created node for tree 1 is gone -> node of tree 1 is active but the state still has tree 2 as aktive tree
5. try creating a node 💥

On this branch it does no longer break (undo & redo). I tested this; so should be fine that you don't test.

### Issues:
-

------
(Please delete unneeded items, merge only when none are left open)
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9555e48609f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.