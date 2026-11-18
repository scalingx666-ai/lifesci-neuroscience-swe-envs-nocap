# Issue

**Title:** [SCHEMA] Require complete BrainVision file triplets

## Description

.

This adds a schema check requiring matching `.eeg`, `.vhdr`, and `.vmrk` files for raw EEG and iEEG BrainVision recordings.

The check reports one error per incomplete recording. I tested complete triplets, every missing extension, files with different recording stems, datasets without an explicit `DatasetType`, and derivatives. It also catches the missing `.eeg` file in OpenNeuro dataset `ds005815`.

Validation:

- `83 passed, 1 skipped` in `bidsschematools`
- `18 passed` in the focused validator checks
- no new failures in the full BIDS Validator suite compared with baseline

The remaining `check_links` failure is caused by the existing dbGaP URL and is addressed separately in #2502.

This checks companion-file existence only. It does not validate the internal `DataFile` and `MarkerFile` references.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e73ff496d8f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.