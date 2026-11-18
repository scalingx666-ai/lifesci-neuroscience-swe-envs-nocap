# Issue

**Title:** fix: hygiene sweep slice C — DesignMatrix and Roc

## Description

Slice S-C of the 0.6.0 hygiene sweep (#535): DesignMatrix, events I/O and Roc. Every finding was reproduced before it was fixed; each behavioural change carries the test that failed on master.

Findings fixed (ids from the #535 tracker): C-01, C-02, C-03, C-04, C-05, C-06, C-07, C-08, C-09, C-10, C-11, C-12, C-13, C-14, C-15, C-16, C-17, C-18 (upsample half).

DesignMatrix:
- `clean` no longer drops a column through one it already removed (the #521 regression test stays green).
- No-op transforms return an owned copy; `convolve` raises on a `<col>_c{i}` name collision and carries the confound role through convolution.
- `downsample`/`upsample` reject a nonpositive or nonfinite target and keep the row count right on a column-less design; the transient grouping key can no longer collide with a user column; one shared upsample implementation.
- Polars `with_columns` calls use generator expressions rather than materialised lists.

Roc:
- One shared input normalisation between `__init__` and `calculate` (trailing singleton axes squeezed, lengths and finiteness checked, `input_values` required).
- The default criterion grid is now the empirical set of operating points plus `np.inf`, so the AUC equals `sklearn.metrics.roc_auc_score` exactly; the infinite corner stays on the curve but is never selected as `class_thr`, and an explicit all-non-finite `criterion_values` raises.
- Forced-choice errors are paired by subject; pair centring is derived per call rather than mutating `input_values`.

Migration rows: seven (the Roc changes and the convolution collision) in the Quick reference table.

Gates: `uv run poe ok` after rebase onto f595e602, the touched test files at `-m ''`, strict docs build. The parked classification tutorial's AUC will move when it returns to the nav.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f595e60225cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.