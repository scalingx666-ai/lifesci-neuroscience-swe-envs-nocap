# Issue

**Title:** [MEM] Decouple process_inverse_2018 from process_inverse_mem

## Description

The goal of this PR is to better separate the code between MEM (process_inverse_MEM and process_inverse_2018). After version 3.2.0, all the computation is done inside process_inverse_MEM.


After version 3.2.0,  all the main code of MEM resides in process_inverse_mem without a call to  process_inverse_2018.

This is helpful so that:
- process_inverse_mem is standalone and easy to read/modify
- It is easier to keep the best package and process_inverse_2018 in sync

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `53d07249e6e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.