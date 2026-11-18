# Issue

**Title:** Clarify PSD threshold units and recording scaling

## Description

Clarifies the distinction between PSD thresholds in the public recording API and the low-level array function. The public coherence+psd path retrieves traces with return_in_uV=True, so its threshold is in microvolts squared per Hz when recording calibration is correct. The low-level function uses the supplied array's units squared per Hz.

. Includes gain examples for samples stored in volts and microvolts, and equivalent thresholds of 0.02 uV^2/Hz and 2e-14 V^2/Hz. No numerical behavior changes.

Validation: the bad-channel test module passed (9 passed, 3 optional tests skipped). A deterministic numerical experiment confirmed PSD scaling by 1e-12 and identical channel labels with equivalent thresholds. Documentation HTML was not built locally. Submitted as a draft for review.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80aa6436dfc2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.