# Issue

**Title:** Read binary data as single when single precision is enabled

## Description

eeg_getdatact read float32 data files into double and converted to single afterwards, which doubles the memory needed and makes loading large files very slow. The data is now read directly as single when the single-precision option is on; the double path is unchanged. Verified on the sample dataset that both paths return values identical to a reference read.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2922a4cb05d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.