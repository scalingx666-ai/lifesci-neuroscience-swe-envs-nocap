# Issue

**Title:** Hide dataframe property from InstanceTables for classes

## Description

Feature categories utilize `InstanceTable` as a class table to simplify querying different modalities that fit into a semantic category. `dataframe` property of  `InstanceTable`s is only useful when there are instances within. Therefore, this will be hidden now for features, that is, `siibra.features.cellular.<TAB>` will not show `dataframe`, nor should it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f466c95b71f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.