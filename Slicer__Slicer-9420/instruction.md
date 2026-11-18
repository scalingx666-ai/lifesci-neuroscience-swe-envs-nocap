# Issue

**Title:** BUG: Fix node name reused in SampleData logic loadNode

## Description

`SampleDataLogic.loadNode` (and `loadScene`) used a mutable dictionary as the default value of `fileProperties` and stored the node name in it. If a node was loaded with a name and then another node was loaded without a name, the previously specified name was used again. The method also modified the dictionary passed by the caller.

The method now works on a copy of the properties. Added `test_loadNodeWithoutNameAfterLoadWithName` to the SampleData test.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d38aed75ec31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.