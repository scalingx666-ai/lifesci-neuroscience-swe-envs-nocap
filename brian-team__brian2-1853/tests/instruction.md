# Issue

**Title:** brian2cuda: replace the defualt std c++ version from c++11 to c++17

## Description

This modification is brian2cuda relevant Replace the default std version from c++ 11 to c++ 17. [c++11 will eventually not be supported in future CUDA toolkit](https://github.com/NVIDIA/thrust/blob/main/CHANGELOG.md#thrust-1100-nvidia-hpc-sdk-209-cuda-toolkit-112). And thrust is merged to cccl, which only supports c++17 and c++20.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0dfb15d78fc2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.