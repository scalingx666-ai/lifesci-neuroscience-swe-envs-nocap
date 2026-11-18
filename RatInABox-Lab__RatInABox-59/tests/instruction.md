# Issue

**Title:** New RewardCache setting, Verbosity changes, Test functions/scripts

## Description

- ray example script :: still needs work

- reward_cache now has a `default_reward_level` setting 
it sets a reward signal magnitude when nothing is happening ... may be useable for hunger/satiation states (https://web.eecs.umich.edu/~baveja/Papers/IMRLIEEETAMDFinal.pdf) and discourage dwelling. Sort of a gain knob.

- test function for environment loop :: runs the loop

- verbosity setting changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ab2e66ea94c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.