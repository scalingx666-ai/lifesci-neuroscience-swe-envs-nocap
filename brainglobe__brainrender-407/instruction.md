# Issue

**Title:** update tests and pyproject to latest vedo

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Scheduled tests failed, because of API changes in latest `vedo`

**What does this PR do?**
Update tests to match new API, and require latest vedo in `pyproject.toml`

Also, makes a bounds tests less strict - this is fine for our purposes, but worth flagging to @marcomusy that [the `gene` actor in `test_integration.py::test_gene_expression`](https://github.com/brainglobe/brainrender/blob/2496ab0bf80e48e28dd24b5293a0bb45f85242bf/tests/test_integration.py#L210) returns different bounds for `vedo` 2024.5.2 and 2025.5.2 - is this expected?

(output of a bash script that installs the `vedo` versions and then calls a Python script that prints the actor's bounds)
```Collecting vedo==2024.5.2
...
Installing collected packages: vedo
  Attempting uninstall: vedo
    Found existing installation: vedo 2025.5.3
    Uninstalling vedo-2025.5.3:
      Successfully uninstalled vedo-2025.5.3
Successfully installed **vedo-2024.5.2**
**gene bounds [ 6400.  9400.  1600.  6000. -9800. -1600.]**
...
Installing collected packages: vedo
  Attempting uninstall: vedo
    Found existing installation: vedo 2024.5.2
    Uninstalling vedo-2024.5.2:
      Successfully uninstalled vedo-2024.5.2
Successfully installed **vedo-2025.5.3**
**gene bounds [  6000.   9600.   1200.   6200. -10000.  -1400.]**
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2496ab0bf80e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.