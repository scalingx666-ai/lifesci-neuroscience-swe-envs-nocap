# Issue

**Title:** Fix issues with OFF surface import/output format

## Description

* Vertices were not converted to mm
* Vertices order in faces was inverted leading to inwards normals

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `83e1d7972bdf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.