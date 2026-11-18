# Issue

**Title:** Preparations for agglomeration meshing

## Description

* Fixed potential infinite recursion with `super(self.__class__, self)`. See [StackOverflow](https://stackoverflow.com/questions/18208683/when-calling-super-in-a-derived-class-can-i-pass-in-self-class)
* Consistent indentation in tasks.py, removed unnecessary imports
* Uncommented `HyperSquareTask` since clearly broken
* MeshTask now supports a remap table, instant generation of manifests (only useful if meshes are confined to a single chunk), and adjustable lower/higher chunk overlaps. Required for meshing agglomerations

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4be393d537b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.