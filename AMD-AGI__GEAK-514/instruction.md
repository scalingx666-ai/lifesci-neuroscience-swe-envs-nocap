# Issue

**Title:** gpu_lock.sh: settle before treating busy GPU as foreign

## Description

**Problem:** When GEAK runs commands back to back (for example, a correctness check followed by a benchmark), the second command sometimes failed with "foreign work running". The benchmark then produced no output.

**Root cause:** The idle check reads `gpu_busy_percent`, which drops gradually after a job ends. A few seconds after the previous command finished, the GPU still looked busy, so the check treated GEAK's own job as another tenant.

**Fix:** After taking the lock, wait for the GPU to become idle and refuse only if it stays busy. Pool mode waits up to 5s and then tries the next GPU. Single-GPU mode waits up to 30s and then fails. `GEAK_GPU_SETTLE_S` overrides both timeouts.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `02095f2c8665`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.