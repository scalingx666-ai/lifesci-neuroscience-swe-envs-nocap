# Issue

**Title:** Add n_jobs to get_data for parallel per-subject processing

## Description

.

## What

Adds an `n_jobs` parameter (default `1`) to `BaseParadigm.get_data` and `BaseDataset.get_data`, parallelizing the per-subject load/preprocess loop with `joblib.Parallel`.

Per-subject operations (reading raw, filtering, resampling, epoching) are independent, so this gives a near-linear speedup on datasets with many subjects, with **identical numerical results**.

## How

- `BaseDataset.get_data(..., n_jobs=1)`: the `for subject in subjects` loop is dispatched to `joblib.Parallel`. Subject-validity is still checked up front (before spawning workers). The per-subject body (load + session selection) is factored into a picklable method `_get_selected_subject_data` so it can cross process boundaries.
- `BaseParadigm.get_data(..., n_jobs=1)`: threads `n_jobs` into each `dataset.get_data` call.
- `n_jobs=1` runs inline (no process spawn), so the default path is unchanged.

## Notes

- Cache writes stay per-subject, so parallel workers do not collide.
- Filter-level parallelism (MNE `n_jobs`) does not help here because the default IIR filtering is not parallelized by MNE; subject-level parallelism is the effective lever.

## Verification

`get_data(n_jobs=1)` vs `n_jobs=2/3` produce identical `X`, `y`, and metadata (seeded `FakeDataset`), and subject order is preserved.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `515dfc305869`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.