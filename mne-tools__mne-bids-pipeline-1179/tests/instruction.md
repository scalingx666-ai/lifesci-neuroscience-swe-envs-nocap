# Issue

**Title:** MAINT: Verify sizes on download

## Description

All PRs are failing due to  but it would probably be better if the failure mode was clearer. Not sure why we had `verify_sizes=False`, but let's get rid of it so we get failures earlier like:
```
E   RuntimeError: Server claimed size of /home/larsoner/mne_data/ds003392/sub-01/meg/sub-01_acq-calibration_meg.dat would be 40121 bytes, but downloaded 0 bytes.
```
Also, print the download command in case it's helpful to replicate it locally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0eff5f16775b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.