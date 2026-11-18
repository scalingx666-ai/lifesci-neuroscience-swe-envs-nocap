# Issue

**Title:** Assorted one-line correctness fixes (armacor, 3dXClustSim, edt_coerce, 3dpc, 3dDWItoDT)

## Description

.

Five independent one-or-two-line fixes, one commit, each explained in the commit message: `fabs()` for armacor's correlation cutoff (the int `abs()` truncated every |c|<1 to 0, always stopping the ARMA(3,1)/(5,1) correlation sequence at lag 5/7); `realloc(fps, …)` for ETAC's copy-pasted `realloc(tfs, …)` (aliasing/use-after-free when the calibration history exceeds 128 entries); Rec.601 luma 0.299/0.587/0.114 without the spurious ×255 in `EDIT_coerce_type`'s RGB→gray; drop the +0.499 from 3dpc's `%f` variance labels; and set gscale=1 for below-threshold gradient rows in `Computebmatrix` (mirroring `Form_R_Matrix`'s existing guard) so `0 0 0` rows no longer produce NaN tensor fits. All files compile cleanly with `-Wall`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `515e7d91a58b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.