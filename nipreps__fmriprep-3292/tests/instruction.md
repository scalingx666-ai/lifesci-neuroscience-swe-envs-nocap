# Issue

**Title:** FIX: Write out boldref-space brain mask with minimal level

## Description

.

Changes proposed in this pull request
- Create `init_ds_boldmask_wf` workflow. This might be overkill.
- Write out the boldref-space brain mask in `init_bold_fit_wf`.
- Stop writing out boldref-space brain mask in `init_ds_bold_native_wf`, since it's written out in `init_bold_fit_wf` now.
- Update expected outputs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c95ebe3bddd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.