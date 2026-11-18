# Issue

**Title:** use `black <= 21.12b0`

## Description

There was a build error in
 that was caused by
black requiring click>=8 and neurodocker requiring click<8. I tried
using click 8.x but it caused a problem in the --copy instruction. So
instead I pinned black to a version from december 2021.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `31f567b1f030`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.