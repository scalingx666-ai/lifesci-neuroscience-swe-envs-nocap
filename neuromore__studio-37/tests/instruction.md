# Issue

**Title:** Fix FFT, set kissfft from float to double

## Description

kissfft was upgraded from v130 to v131.
but used type was not switched from float (default) to double (as in old version and required).
this broke fft graph node and output view of its spectrum

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `398fdd87bd32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.