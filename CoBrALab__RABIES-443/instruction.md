# Issue

**Title:** FIX: Change mask default from 'NULL' to 'NOMASK' in registration.py

## Description

minc-toolkit-extras/antsRegistration_affine_SyN.sh needs 'NOMASK' instead of 'NULL' for non-specified mask images. ANTS will crash for argument `--moving-mask NULL`

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->

## Summary by CodeRabbit

* **Bug Fixes**
  * Improved default mask handling in image registration: both moving and fixed images now use “no mask” by default, preventing issues caused by previous NULL defaults and ensuring consistent no-mask behavior.
  * No other registration behavior is changed. If your workflow relied on the old NULL semantics, specify masks explicitly to retain prior behavior.

<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f6facc760b88`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.