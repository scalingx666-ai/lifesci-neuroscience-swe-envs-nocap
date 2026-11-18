# Issue

**Title:** Use BIDSURI in init_ds_boldmask_wf

## Description

.

## Changes proposed in this pull request

- Replace `RawSources` in `init_ds_boldmask_wf` with `Sources` determined using `BIDSURI`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2f686974402`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.