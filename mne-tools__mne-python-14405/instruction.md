# Issue

**Title:** MAINT: Update dependency specifiers

## Description

Created by the `spec_zero` job of this [GitHub Action run](https://github.com/mne-tools/mne-python/actions/runs/38208184107).

*Adjustments may need to be made to shims in `mne/fixes.py` and elsewhere in this or another PR. `make -C tools/dev dep` is a good starting point for finding potential updates.*

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `995ee6255b04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.