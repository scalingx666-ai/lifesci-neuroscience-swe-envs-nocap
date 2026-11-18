# Issue

**Title:** perf+feat: allow input of CrackleArray for lower memory usage

## Description

Crackle is an extremely compressed representation for segmentation (hundreds to thousands of times) while still providing access to various functions, such as connected components and decoding to binary images rapidly.

If we provide a CrackleArray instead of a numpy array for the initial input to Kimimaro, we can shrink the memory usage of the input labels and (most of the time) the cc_labels, to near-zero.

https://github.com/seung-lab/crackle

This update also include a small general performance improvement for extracting the dbf for each segment.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e40da9f1cbc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.