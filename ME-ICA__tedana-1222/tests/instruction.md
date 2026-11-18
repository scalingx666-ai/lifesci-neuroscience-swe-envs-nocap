# Issue

**Title:** Replace `--mir` with `--gscontrol mir` in ica_reclassify

## Description

.

Changes proposed in this pull request:

- Replace the `--mir` flag in `ica_reclassify` with `--gscontrol mir`.
- Support `--gscontrol gsr` in `ica_reclassify`, rather than automatically detecting if gsr was run previously.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a33d5c5071ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.