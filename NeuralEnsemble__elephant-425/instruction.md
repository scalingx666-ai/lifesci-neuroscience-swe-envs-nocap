# Issue

**Title:** Issue with units in BinnedSpikeTrain

## Description

BinnedSpikeTrain does not properly rescale `t_start` and `t_stop` to the units of input spiketrains (`spiketrains[0].units`) in case they differ. A small correction in two lines of code solved the issue for me.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `647938190a62`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.