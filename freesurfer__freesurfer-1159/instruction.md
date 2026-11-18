# Issue

**Title:** Fixed bugs in inference.py

## Description

Make sure FreeSurfer is sourced, model path depends on FREESURFER_HOME, load model file with map_location=device

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77b0e90e9637`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.