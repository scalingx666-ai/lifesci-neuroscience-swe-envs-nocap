# Issue

**Title:** Allow digesting Ebrains Dataset V3 information

## Description

```python
from siibra.retrieval.datasets import EbrainsV3Dataset
dataset = EbrainsV3Dataset("5a16d948-8d1c-400c-b797-8a7ad29944b2")
print(dataset.version_ids)  # useful for extracting a specific version
print(dataset.contributors)  # a list of contributors collated from versions of the dataset
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff34c7f77fd3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.