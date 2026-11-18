# Issue

**Title:** Parallel measure extraction

## Description

Hi Lauren,

I have updated wm_measure_all_subjects.py to enable parallel computation, considering the number of clusters and the number of subjects can be large. Also the changes will address Saba's problems I think. Just saw the email.

I also updated tract_measurement.py to sort the measurement files. Otherwise, it may generate mismatch error to the demographics file when doing the statistics. This happened to the dataset I am working now. glob.glob somehow did not output the files ordered by file names. Not sure if this would break you previous analysis.

Regards,
Fan

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4996c7a24ed6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.