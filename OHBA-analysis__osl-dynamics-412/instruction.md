# Issue

**Title:** Improved Parallelisation

## Description

Changes:
- Some calculations (e.g. `np.cov`) use all cores by default. This is problematic when we we have multiple processes. We limit each worker to one thread.
- Switched from `pqdm.processes` to `pqdm.threads` in `osl_dynamics.analysis.spectral`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d18bf559c727`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.