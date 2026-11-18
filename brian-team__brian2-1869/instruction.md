# Issue

**Title:** Add dtype keyword to StateMonitor

## Description

Useful in particular to save memory by using float32 to record a float64 variable

I actually thought we had this already (see my comment at https://brian.discourse.group/t/memory-error-insufficient-disc-space/1471/2) …

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cf0b25cce13b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.