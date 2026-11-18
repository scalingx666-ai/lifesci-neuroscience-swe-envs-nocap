# Issue

**Title:** qsublist bugfix for slurm job-kills

## Description

In qsublist, the output file is not written if the job was killed, which is why now we also check that the error file is empty (instead of just waiting forever on the output file)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `268f149a3147`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.