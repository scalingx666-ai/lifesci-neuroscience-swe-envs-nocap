# Issue

**Title:** ENH save evaluation results per subject as soon as they are computed

## Description

### ENH save evaluation results per subject as soon as they are computed (#419, #775)

process() used to write a dataset's results to the HDF5 file only after
every fold of the dataset had finished, so a crash lost all of them.
Fold results are now streamed from joblib (return_as='generator', list
fallback for joblib < 1.3) and each (pipeline, subject) pair is written
as soon as all its folds are done. That pair is the unit the results
cache uses for resume, so no partial subject is ever written and a
rerun with overwrite=False computes only the missing subjects. Writes
stay in the main process; the HDF5 layout and values are unchanged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `53c45b901a4a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.