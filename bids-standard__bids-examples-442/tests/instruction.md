# Issue

**Title:** FIX: eeg ds003645s hed demo

## Description

This fixes two issues with `eeg_ds003645s_hed_demo` identified by the schema validator. 

1) `electrodes.tsv` does not permit a `task` entity.
2) sub-004/ses-1 EEG files lacked a sidecar. I just copied what was consistent in sub-002/003 into a top-level sidecar.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `daa948aedd11`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.