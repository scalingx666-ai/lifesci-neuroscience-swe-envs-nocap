# Issue

**Title:** Fix out-of-bounds read in GCAfindStableSamples (no change in output)

## Description

label_counts[best_label] would read OOB when best_label=-1.
This is a no-op though, since the next block is conditional on best_label >= 0.
This would matter most for sanitized compilation (e.g., mri_em_register and mri_deface), where an OOB read would block.

This is the minimal change. Alternatively, we could also scope everything under a single conditional (best_label=>0), but then the randomNumber() stream would be shifted, failing to preserve behavior.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e5a9b7f504a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.