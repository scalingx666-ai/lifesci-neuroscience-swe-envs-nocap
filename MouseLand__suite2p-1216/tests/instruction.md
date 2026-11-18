# Issue

**Title:** Fix GUI Issues with mac machines and NWB warning issue.

## Description

- Fixes issues with running suite2p GUI on Mac M chip machines, openBLAS parallel operations crashing via QT
- Update registration to be using float32 for usage with M1-M4 machines as float64 doesn't work with torch.device(`mps`) unfortunately... 
- Addresses pynwb issue described in #1138 
- Fix mps grid sampling issue and added a test to compare mps transform_data with cpu transform_data
- Fix neuropil_extract = False issue (#1221)
- Fix setuptools issue with #1206

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6ed85fc81f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.