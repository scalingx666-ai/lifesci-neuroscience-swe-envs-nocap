# Issue

**Title:** bugfix get_set_qsm_ndi.m on load config

## Description

load config errors because action_handle has length 4 which then results in str_pattern{5} not existing for isGPU

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4974b04e669f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.