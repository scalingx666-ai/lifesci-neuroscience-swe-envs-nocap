# Issue

**Title:** [MAIN] update codemeta.json

## Description

This pull request updates the `codemeta.json` file on master branch to trigger the automatic update of the Elephant knowledgegraph entry: <https://search.kg.ebrains.eu/instances/0d52822e-0e77-4cf2-b945-e59f5a508987>.

The changes are taken from the `release-v1.1.1`  branch.

**Note**
Automatic updates of the KG entry are only triggered if the codemeta file on master is changed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `932edb5a46e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.