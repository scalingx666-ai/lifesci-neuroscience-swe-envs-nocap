# Issue

**Title:** [io] Improve NIRS input/outputs

## Description

This PR is here to slightly improve the IO for nis: 
- making the snirf reader a bit more robust to wrongly formatted snirf files
- improve the export of the snirf file when there is no event or only one time point. 
- Port some of the fixes for reading channel files from   (also cleaned the fix)


Once this PR is merged, I'll circle back on the read/write of BIDS datasets for nirs. (at least to make sure we can fully read nirs BIDS datasets)


Regards
Edouard

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89d5a7914360`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.