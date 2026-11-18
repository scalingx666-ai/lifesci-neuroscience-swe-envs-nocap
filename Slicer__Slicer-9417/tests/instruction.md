# Issue

**Title:** BUG: Fix Save Data dialog test failure when output file already exists

## Description

`qSlicerSaveDataDialogSaveOutcomeTest` saved the transform node to the default save directory (such as the user's Documents folder). If a file with the same name (`LinearTransform.h5`) already existed there, the Save Data dialog displayed an overwrite confirmation popup. The test only clicks the Save button, so the popup blocked the test until its safety timer closed the dialog, and the "successful save accepts" case failed.

The test now sets the storage node file name to a file in an empty temporary directory, so the result does not depend on the content of the user's folders.

Tested on Windows with an existing `LinearTransform.h5` in the Documents folder: the test failed before the change and passes after it (3 repeated runs).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e3afed9a5030`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.