# Issue

**Title:** TVB-2513 Fix Github actions

## Description

- [x] Compatibility with Python 3.10
- [x]  Have dedicated requirements.txt files for tvb-library and tvb-framework
- [x]  fix Github action build.yml
- [x]  fix Github action lib-tests.yml
- [x]  Adapt code to latest nibabel API (used in nii and trk importers)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34b3c4bcc267`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.