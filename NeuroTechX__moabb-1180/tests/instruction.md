# Issue

**Title:** Fix pyRiemann mean API compatibility in TRCA and TRCSP

## Description

MOABB imports the deprecated `mean_covariance` symbol, which pyRiemann development versions have removed. TRCSP also passes the metric positionally, causing a TypeError with pyRiemann 0.12; TRCA reaches the deprecated wrapper with a metric keyword.

Use `gmean` in TRCA and TRCSP and pass the TRCSP metric by keyword. This API works with both pyRiemann 0.12 and current 0.13.dev0. Keep the existing `pyriemann>=0.12` PyPI dependency.

Add regression tests for TRCSP fitting/transformation with three metrics and TRCA covariance means with two metrics. The import failure on 0.13.dev0 and TRCSP failure on 0.12 were reproduced before the fix; the classification suite passes with both versions after the fix.

Related downstream report:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f027538273bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.