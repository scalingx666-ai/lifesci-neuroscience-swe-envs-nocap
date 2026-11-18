# Issue

**Title:** [REF] Overhauls `stats.correlate_images()`

## Description

Makes `stats.correlate_images()` more generic `stats.compare_images()`, which accepts any user-provided similarity metric callable (in addition to `'pearsonr'` and `'spearmanr`', as before).

Also updates `stats.permtest_pearsonr()` --> `stats.permtest_metric()` to reflect changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75dddf33cfde`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.