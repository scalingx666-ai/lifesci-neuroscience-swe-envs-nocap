# Issue

**Title:** BUG: use fixed normalized CTPS cutoff for automatic ECG detection

## Description

`ICA.find_bads_ecg(method="ctps", threshold="auto")` now uses a fixed cutoff of 0.3 on the maximum normalized Kuiper score, following the JuMEG example linked in the review. The cutoff no longer depends on sampling frequency or trial count. The normalized scores themselves can still vary with the input data; this does not introduce an effect-size statistic.

Removed the threshold-calculation helpers and updated the docstring and changelog. Regression tests compare automatic detection with an explicit `threshold=0.3` across trial counts and sampling rates, with coverage for both Raw and Epochs inputs.

Local validation: 6 tests passed; the optional Picard case was skipped because Picard is not installed. Ruff lint, formatting, and changelog-name checks passed.

AI assistance: Codex assisted with implementation and regression tests, including the revision to the fixed cutoff.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `44ac7433273a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.