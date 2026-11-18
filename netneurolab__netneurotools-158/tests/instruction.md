# Issue

**Title:** [ENH] Add simulate_atrophy() + related functions

## Description

This commit adds to `netneurotools` functions to simulate atrophy spreading on brain networks with a SIR model. This is a python version of SIRsimulator, written by Ying-Qiu Zheng: https://github.com/yingqiuz/SIR_simulator

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c81138915e9d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.