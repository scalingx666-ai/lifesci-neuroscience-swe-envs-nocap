# Issue

**Title:** feat: low memory but slow version of cross section analysis

## Description

This low memory version uses crackle as a base image representation. Running as a single process on a multi-core machine, it can just about pace the standard high memory version. Using a single core, decoding to a binary image takes a while for each step (on the order of 1-2 seconds) so it takes a lot longer. 

The advantage is that it would be possible to use extremely large volumes and reduce the need for repairs.

using cross_sectional_area_shape_delta=250 (+100 above standard)

<img width="842" height="471" alt="image" src="https://github.com/user-attachments/assets/825f3160-45fc-4812-a54f-e60e835d94d8" />
(blue) standard +100 delta (black) low mem version +100 delta

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5a7c362eca3a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.