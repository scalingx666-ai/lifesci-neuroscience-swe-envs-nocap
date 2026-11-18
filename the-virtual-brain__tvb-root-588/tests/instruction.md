# Issue

**Title:** TVB 3017. Fix allenSDK incompatible with TVB

## Description

This task started as a bug found in a notebook using the allen_creator module. It proved to be in fact a problem from TVB, namely the usage of TVBEnums, which, in some cases, was incorrec.  So I fixed this problem everywhere I could find it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a38552135242`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.