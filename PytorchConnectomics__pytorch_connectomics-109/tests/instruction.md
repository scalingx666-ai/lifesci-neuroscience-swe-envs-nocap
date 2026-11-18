# Issue

**Title:** initial commit for CondSeg

## Description

### Edited 
- `dataset_cond.py`

### Added:
- `condseg/build.py`
- `condseg/collate.py`
- `condseg/config.py`
- `condseg/trainer.py`

- `configs/JWR15/JWR15-Synapse-Base.yaml`
- `configs/JWR15/JWR15-Synapse-BCE-DICE.yaml`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ea31f068aed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.