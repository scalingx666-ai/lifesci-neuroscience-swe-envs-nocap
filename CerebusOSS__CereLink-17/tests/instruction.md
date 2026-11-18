# Issue

**Title:** fix for issue 16

## Description

fixes issue 16 that prevents cbpy.open from working correctly (con.szOutIP and con.nOutPort were switched with con.szInIP and con.nInPort in the cbpy_open function)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a967549f3222`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.