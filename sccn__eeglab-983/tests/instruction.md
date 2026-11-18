# Issue

**Title:** Speed up runica extended Infomax about 1.4x with identical results

## Description

Rewrites the per-block tanh, sign and bias products and the kurtosis estimate in runica without changing the arithmetic. Full extended runs were 1.34-1.44x faster on an idle 8-core laptop (MATLAB R2026a, MKL). On 9 recordings the weights match the current code to 5e-15 with the same step counts, order and signs. Thread settings are untouched and bsxfun keeps pre-R2016b MATLAB working. Not yet tested on Intel, macOS or Octave. Details and caveats in the comment below.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0963be9d81a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.