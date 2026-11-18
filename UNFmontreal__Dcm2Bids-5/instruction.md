# Issue

**Title:** Log to dcm2bids.log, better directory hierarchy

## Description

outputdir is the root of the study, and everything gets written inside this directory.

outputdir has 3 folders: 1) sourcedata (bids converted data), 2) derivatives (empty - placed here to nudge users in the right, BIDS-compliant direction), 3) tmp_dcm2bids (so no longer kept in cwd).

We also keep a basic log in outputdir/dcm2bids.log, which is handy for keeping track of which dicom dirs went with which subject number etc... 

Depends on previous PRs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29dba4393637`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.