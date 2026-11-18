# Issue

**Title:** [FIX] ASR: return an estimate when geometric_median does not converge

## Description

## Summary
When the Vardi–Zhang iteration in `geometric_median` reached `max_iter` without
meeting the tolerance, the `while ... else` branch only printed a message and
the function fell through to an implicit `return None`, which breaks callers
(`asr_calibrate` / `asr_process` reshape the result). Return the last iterate
`y` instead, which is the best estimate available.

The message wording is also fixed ("could converge" → "could not converge").

## Correctness
- The converged path is unchanged.
- On non-convergence the function now returns a correctly-shaped array instead
  of `None` (verified with a forced single-iteration run).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `160660110f33`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.