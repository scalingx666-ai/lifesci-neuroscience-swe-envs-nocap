# Issue

**Title:** Time dependent inputs for FHN, WC, Hopf

## Description

Include time-dependent inputs to the FHN model, the WC model, and the Hopf model.
- move "adjust_shape" function from aln time integration file to general file in utils
- fix bug in test_models
- add tests for stimulation of FHN, WC, Hopf

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e701a5829a88`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.