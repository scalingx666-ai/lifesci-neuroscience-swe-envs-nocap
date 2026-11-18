# Issue

**Title:** reimplementation of gpu_count

## Description

fix #3717 

I tried to write a simpler implementation of `getGPUs` from gputil package. 
I used a separate file to include their license.

This need to be tested under windows with Python 3.12+ and I don't have such system, so it's **untested** for now.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe20d4534102`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.