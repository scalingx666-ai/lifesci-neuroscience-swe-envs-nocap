# Issue

**Title:** Add n_jobs_data to evaluations for parallel subject loading

## Description

## Problem
`BaseDataset.get_data()` already loads subjects in parallel with `n_jobs`, and `BaseParadigm.get_data(n_jobs=...)` forwards it, but `BaseEvaluation._load_data()` never passes it. Subject loading in every evaluation is therefore sequential.

On a network filesystem this dominates the runtime for anything that is not in the array cache. When we read raw EDFs over CephFS, a single reader was latency-bound at ~2 MB/s (process in `D` state, ~0% CPU), while the same filesystem streams a cold file at ~130 MB/s. Reading several subjects at once overlaps those round-trips.

## Change
- New evaluation keyword `n_jobs_data` (default `1`, so behavior is unchanged), placed last in the signature so positional callers are unaffected.
- `_load_data()` forwards it as `n_jobs` to `paradigm.get_data`. It is only forwarded when it is not `1`, so custom paradigms whose `get_data` has no `n_jobs` keep working.
- It is independent of `n_jobs` (fold-level parallelism): loading finishes before the folds are evaluated.

## Tests
`test_n_jobs_data_forwarded_to_get_data` (parametrised 1 / 2) spies on `paradigm.get_data`, then checks that the value is forwarded and that the loaded `X`, `y` and `metadata` are consistent and cover the requested subjects.

## Verification (Voyager, isolated serial runs)
- `ruff check` + `ruff format --check` on the changed files: clean.
- New test(s): **fail on unmodified `develop`**, pass on this branch.
- Full test file of the touched module on this branch, compared with a `develop` baseline run in the same environment: no new failures.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4134f4920152`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.