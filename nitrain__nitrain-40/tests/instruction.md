# Issue

**Title:** Multi-GPU support for constraints/regularizers

## Description

Fix to Constraints and Regularizers in order for them to work correctly when the module is wrapped into a DataParallel object.  Note that this fix could be applied in module_trainer.py but it's probably better to duplicate the code in constraints/regularizers in case others choose not to use module_trainer or change it to suit their needs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8804b41c4732`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.