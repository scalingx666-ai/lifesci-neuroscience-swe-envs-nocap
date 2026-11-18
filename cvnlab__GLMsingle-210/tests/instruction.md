# Issue

**Title:** Fit each run with its own options in single-run fits

## Description

The run-wise FIR diagnostic and the LSS loop (`wantlss=1`) fit one run at a time, but pass the per-run options for all runs. `glm_estimatemodel` then reads entry 0, so every run gets run 1's `extra_regressors` and `maxpolydeg`.

Consequences:
- **`extra_regressors` with runs of different lengths:** `fit` crashes in the FIR step (`ValueError ... size 264 ... size 291` from `np.c_[pmatrix, extra_regressors]`).
- **`extra_regressors` with equal lengths:** runs 2..N are silently fitted with run 1's regressors (FIR diagnostics, and the LSS betas).
- **Defaults only:** when run lengths round to different default `maxpolydeg` values (e.g. TR 1.5 s, 264 vs 291 volumes → 3 vs 4), runs 2..N get run 1's degree.

The MATLAB code has the same pattern: the FIR loop passes the whole `maxpolydeg`, and the LSS loop passes both options whole.

**Fix:**
- Python: a `run_opts(opt, p)` helper slices both options to the run being fitted; it is used at the two call sites.
- MATLAB: index both options by run. Not run; I have no MATLAB.
- `tests/test_per_run_options.py`: 4 tests that fail on `main` and pass here.

**Impact on two real sessions** (3T with equal runs; 7T with runs of 264–291 volumes; motion regressors from fMRIPrep):
- With `wantlss=0`, the betas (types A–D) are bit-identical to `main`. Only the FIR diagnostics change, for runs 2..N.
- With `wantlss=1`, type D is identical. Type B (LSS) changes for runs 2..N.
- 3T with motion regressors: LSS betas for runs 2..N change substantially (median per-voxel r with `main` 0.73–0.82).
- 7T with defaults only: runs 2–5 now get their documented degree (3) instead of run 1's (4). The LSS betas change a little (r 0.93–0.99).
- 7T with motion regressors: `main` crashes; this branch completes.

**Not changed here:**
- The empty-regressor check in `glm_estimatemodel` only looks at run 1. If run 1's regressors are all zero, every run's are dropped.
- Types C/D are not reproducible across runs of `main`: `findtailthreshold` uses `GaussianMixture` without `random_state`, and `opt['seed']` doesn't control it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1ab54a65edd3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.