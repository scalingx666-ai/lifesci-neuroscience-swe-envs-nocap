# Issue

**Title:** Added new functionality: support for iterating across parameters in simulations

## Description

param_iter()
_param_generator()

It may be useful to iterate over specific parameters when generating synthetic power spectra. I have added functions (mentioned above) to do such tasks. Responds to #96

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2daa7a592f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.