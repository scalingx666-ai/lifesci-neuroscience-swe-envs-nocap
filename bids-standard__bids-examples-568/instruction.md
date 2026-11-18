# Issue

**Title:** fix(eeg_ds003645s_hed_demo): Remove misplaced headshape file

## Description

sub-004_ses-1_headshape.pos sat at the session level, outside any datatype directory, and headshape files are only defined for MEG. It is an orphan; the accompanying coordsystem.json references sub-03_ses-meg_headshape.pos instead.

Discovered in bids-standard/bids-validator#460, when fixing bids-standard/bids-validator#459.

- BIDS Specification PR: NONE
- BIDS Validator PR: bids-standard/bids-validator#460

cc @VisLab

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7150efcf2c04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.