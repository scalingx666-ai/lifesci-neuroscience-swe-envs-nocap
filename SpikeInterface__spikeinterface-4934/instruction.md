# Issue

**Title:** Patch for Lupin to remove some warnings

## Description

The definition of get_template_peak_shift_on_main_channel has been extended with a peak_sign argument, that should be propagated

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f2913877dba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.