# Issue

**Title:** add SimpleITK.Image to ANTsImage conversion

## Description

- add helper function to get an ANTsImage from a [SimpleITK.Image](https://simpleitk.readthedocs.io/en/master/fundamentalConcepts.html#images)
- add test that does the roundtrip

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f079ba6622f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.