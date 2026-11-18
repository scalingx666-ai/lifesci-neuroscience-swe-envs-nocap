# Issue

**Title:** Pass epochs to SSVEP_itCCA and SSVEP_eCCA in evaluations

## Description

`_pipeline_requires_epochs` in `moabb/evaluations/utils.py` decides whether an evaluation loads `mne.Epochs` or NumPy arrays, and it only checks for `SSVEP_CCA`, `SSVEP_TRCA` and `SSVEP_MsetCCA`. `SSVEP_itCCA` and `SSVEP_eCCA` (added in #1009) also require epochs in `fit`, so an evaluation run on either of them gets arrays and fails. For example, `WithinSessionEvaluation` with `SSVEP_itCCA()` on a three-class SSVEP `FakeDataset` ends on `develop` with `ValueError: X should be an MNE Epochs object.`, and so does `SSVEP_eCCA(freq_map={0: 13.0, 1: 17.0, 2: 21.0})`. On this branch both complete. (The fake epochs name their events "1", "2", "3", so on that dataset eCCA, like `SSVEP_CCA`, needs `freq_map`.)

This adds only these two, because they get correct frequencies under the encoded labels 0, 1, 2 the evaluation passes: `SSVEP_itCCA` does not use frequencies, and `SSVEP_eCCA`, like `SSVEP_CCA`, gets them from `_infer_label_frequencies`, which looks them up through the epochs' event names. `SSVEP_TRCA_R`, `SSVEP_SSCOR` and `SSVEP_TDCA` set their filter bank from `float(label)` (TRCA_R also builds its sine reference from it), so under encoded labels they would work from 0, 1, 2 Hz. `SSVEP_TRCA`, already in the list, does that today: on those epochs with the event names changed by hand to "13", "17", "21" and encoded labels, `SSVEP_CCA` and `SSVEP_eCCA` get `class_freqs_` {0: 13.0, 1: 17.0, 2: 21.0}, while `SSVEP_TRCA` gets `peaks_` [0, 1, 2]. `benchmark()` avoids this by passing `mne_labels=True`. Adding the other three here, as `_ppl_needs_epochs` in `moabb/benchmark.py` does, would be right once those classes take their frequencies the way CCA and eCCA do, but that changes TRCA results, so I left it for you to decide. I'm happy to send it as a separate PR.

New tests check `_pipeline_requires_epochs` for the five classes, bare and wrapped in `make_pipeline`, check that an array pipeline and `DummyClassifier` still return False, and run the itCCA and eCCA evaluations above. With the old `utils.py`, 4 of the 8 new tests fail: the itCCA and eCCA cases of both.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a9cc8722e6f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.