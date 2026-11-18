# Issue

**Title:** Route epoch-requiring pipelines to the epochs branch by estimator type

## Description

## Problem
`benchmark()` decides whether a pipeline gets the epochs branch (`return_epochs=True, mne_labels=True`) from its **name**: `_ppl_needs_epochs` looks for substrings such as `"TRCA-SSVEP"` or `"SSVEP CCA"`. A config that uses a template SSVEP classifier under any other name (e.g. `name: TRCA`) goes down the array branch instead. `BaseEvaluation._load_data` still gives it epochs, because it detects the estimator type, but the labels are label-encoded to `0..n_classes-1`.

`SSVEP_TRCA`, `SSVEP_CCA`, etc. read their labels as stimulus frequencies: TRCA builds its filter bank from them, CCA its sine/cosine references. They therefore train on nonsense **without raising**.

We hit this on Wang2016 (40 targets). It's the same subject, data, split and estimator; only the label mode differs:

| `WithinSessionEvaluation`, subject 1, TRCA | score |
|---|---|
| `mne_labels=True` (frequency labels) | 0.8125 |
| `mne_labels=False` (what the array branch does) | 0.0375 (chance = 0.025) |

## Change
Route a pipeline to the epochs branch if `_ppl_needs_epochs(name)` **or** `_pipeline_requires_epochs(pipeline)`. The latter is MOABB's existing type check, already used by the evaluations, so name-based configs behave as before and renamed ones become correct.

## Tests
`test_epoch_pipelines_routed_by_type_not_name`: a real `benchmark()` run on a fake SSVEP dataset with an `SSVEP_CCA` subclass named `MyCCA`. The classifier must see the stimulus labels `["13", "15"]`. On `develop` it sees the encoded labels and the test fails.

## Verification (Voyager, isolated serial runs)
- `ruff check` + `ruff format --check` on the changed files: clean.
- New test(s): **fail on unmodified `develop`**, pass on this branch.
- Full test file of the touched module on this branch, compared with a `develop` baseline run in the same environment: no new failures.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f26320632003`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.