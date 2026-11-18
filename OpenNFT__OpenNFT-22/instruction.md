# Issue

**Title:** Elevate privileges for installing Matlab Engine for Python

## Description

If we do not have write access in `MATLABROOT` we try to install "Matlab Engine for Python" 
with Administrator/root privileges (It elevate privileges via UAC/sudo).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4709fe640846`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.