# Issue

**Title:** exploration: ncores argument

## Description

User can chose the number of cores for exploration: 

```python
parameters = ParameterSpace({"parameter": parameter_values})
search = BoxSearch(evalFunction = run, parameterSpace = parameters, ncores=2)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `58b61c697b41`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.