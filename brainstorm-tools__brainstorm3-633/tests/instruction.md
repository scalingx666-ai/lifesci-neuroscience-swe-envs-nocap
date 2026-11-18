# Issue

**Title:** Bugfix tuning curves

## Description

* Bugfix for tuning curves process (e-phys): Events without spikes were not counted in the average
* Spike count for tuning curves is based their closest index in the TimeVector
* Correct type of output file in PSTH process

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `11b3c6a39fc6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.