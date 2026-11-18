# Issue

**Title:** Document the duplicated T7/T8 recordings of EPFLP300 subject 3 (two rank-deficient sessions)

## Description

In EPFL's own files for subject 3, sessions 1 and 2 (MOABB sessions `"0"` and `"1"`, the first recording day), the T7 row is identical to MA1 and the T8 row to MA2 in all 12 runs (max |T7 − MA1| = max |T8 − MA2| = 0.0 µV). `EPFLP300` re-references every run to the mastoid mean, as Hoffmann et al. (2008) do, which leaves T7 = (MA1 − MA2) / 2 = −T8 exactly: the 32 EEG channels of these two sessions have rank 31. The other 30 subject-sessions are full rank.

This matters for covariance estimators without shrinkage. `XdawnCovariances(estimator="oas", xdawn_estimator="scm")`, the configuration of `pipelines/XdawnCov_MDM.yml` and `pipelines/XdawnCov_TS_SVM.yml`, factorises the singular `scm` signal covariance in `scipy.linalg.eigh(C, B)`:

- on about half of the fits it raises `LinAlgError: The leading minor of order 24 of B is not positive definite` (T8 is channel 24 and the opposite of T7, channel 7); the MOABB benchmark rerun lost both XDAWNCov pipelines on EPFLP300 this way;
- when the Cholesky factorisation passes by rounding, the null direction becomes the first Xdawn filter, which is rounding noise: XDAWNCov+MDM scores 0.719 ROC-AUC on session `"1"` against 0.799 with `xdawn_estimator="lwf"`.

Shrinkage estimators (`"lwf"`, `"oas"`) are not affected. With `lwf` every fold completes, and on the 30 full-rank sessions the scores match `scm` (mean difference +0.0002 for MDM and −0.0007 for TS + SVM, ROC-AUC with Euclidean alignment; at most 0.0074).

No code change: the loader implements the dataset's documented mastoid reference on byte-identical source files (develop gives the same arrays on all 32 sessions), and no other channel holds the signal needed to restore the rank. This PR adds a Notes paragraph to the `EPFLP300` docstring and a whats_new entry. Switching `xdawn_estimator` to `lwf` in the shipped pipeline configs would avoid the failure but change a reference pipeline, so it is left for a separate decision.

Checked on the original `.mat` files and on the loader's output (2048 Hz unfiltered, and the P300 paradigm at 128 Hz), with develop `ed1aacdb3`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed1aacdb39a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.