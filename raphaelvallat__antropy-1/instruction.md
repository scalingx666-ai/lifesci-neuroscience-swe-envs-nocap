# Issue

**Title:** Faster estimation of Lempel-Ziv Complexity

## Description

#### Speed enhancements addressing 
- Implementation maintained as per  with some restructuring
- Switched from strings to integer arrays for speed gains using Numba
- Maps strings to their UTF-8 representations as 32-bit unsigned integers
- Switched to `np.bincount` instead of `set` for getting unique values faster
- Passes tests
#### Rough performance estimates
 - Hardware: HP Laptop with Intel Core-i5 1035G4 4C8T, 20GB RAM
 - Operating System: Pop OS 20.10 on kernel 5.8.0-7642-generic
 - Python Environment: Python 3.8.5, NumPy 1.19.2, Numba 0.51.2
![image](https://user-images.githubusercontent.com/8765418/112433166-df27af80-8d67-11eb-8b5a-e77246a1698f.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d8d35753cf81`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.