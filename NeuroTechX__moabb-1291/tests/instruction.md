# Issue

**Title:** Pass every filter band to get_data in the evaluations

## Description

## Problem
Since #774 (first released in 1.4.0), `BaseEvaluation._load_data` gives `paradigm.get_data` only `process_pipeline`, and the evaluations take that as `make_process_pipelines(...)[0]`: the processing pipeline of the **first filter** (it keys the results). With a filter-bank paradigm (`FilterBankLeftRightImagery`, `FilterBankMotorImagery`, `FilterBankSSVEP`) the array that reaches the pipeline therefore has one band, shape `(n_trials, n_channels, n_times, 1)`, instead of one per filter. FBCSP and the SSVEP MDM / TS + LR / TS + SVM pipelines are trained and scored on the first band, **without raising**.

We hit this while rerunning the MOABB benchmark paper:

| within session | first band only (develop) | every band (this PR) | published |
|---|---|---|---|
| FBCSP + SVM, 24 MI dataset × task cells within ±0.05 of the paper | 6 / 24 (median −0.074) | 24 / 24 (median −0.002) | |
| SSVEP TS + LR, Nakanishi2015 | 0.26 | 0.89 | 0.87 |
| SSVEP MDM, Kalunga2016 | 0.47 | 0.71 | 0.71 |

Epoch pipelines (TRCA, TDCA, CCA, deep learning) are not affected: when a pipeline needs epochs, `_load_data` already passes `process_pipelines=None` and `get_data` builds every band.

## Change
`_load_data` builds the paradigm's processing pipelines for every band and passes them all. A one-band paradigm keeps the given `process_pipeline`, so nothing changes there. `whats_new` asks users to recompute filter-bank results computed with 1.4.0 to 1.7.2.

## Tests
`test_filterbank_paradigm_reaches_pipeline_with_every_band`, parametrised over `WithinSessionEvaluation`, `CrossSessionEvaluation` and `CrossSubjectEvaluation`: a `FakeDataset` through `FilterBankLeftRightImagery` into a transformer that raises unless the last axis has every band.

## Verification (Voyager, isolated runs)
- `pre-commit` (ruff, ruff format, codespell) on the changed files: clean.
- New tests: **3 / 3 fail on unmodified `develop`**, pass on this branch.
- `test_evaluations.py`, `test_benchmark.py` and `test_paradigms.py` on this branch: all pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9282ba688ec3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.