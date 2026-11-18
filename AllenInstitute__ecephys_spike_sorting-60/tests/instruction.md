# Issue

**Title:** Compatibility with Kilosort3

## Description

The following modules have been updated to work with the outputs of KS3:
* `kilosort_helper`
* `kilosort_postprocessing`
* `mean_waveforms`
* `quality_metrics`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3aa6b9782ecc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.