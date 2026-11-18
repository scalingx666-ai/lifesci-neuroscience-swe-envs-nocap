# Issue

**Title:** utils: Add usable_cpu_count

## Description

We can remove this and rely only on `os.sched_getaffinity` when it
supports the same OSes as `psutil`. See issue #291.

See also https://bugs.python.org/issue26692.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `74dae883a6f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.