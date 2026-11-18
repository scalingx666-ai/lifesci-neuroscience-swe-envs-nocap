# Issue

**Title:** MRG: Add verbose argument

## Description

We get a ton of these messages in MNE because we use `add_data`:
```
Updating smoothing matrix, be patient..
Smoothing matrix creation, step 1
Smoothing matrix creation, step 2
Smoothing matrix creation, step 3
Smoothing matrix creation, step 4
Smoothing matrix creation, step 5
Smoothing matrix creation, step 6
Smoothing matrix creation, step 7
Smoothing matrix creation, step 8
Smoothing matrix creation, step 9
Smoothing matrix creation, step 10
```
This will allow us to pass `verbose=False` to avoid them (this process is quick enough we don't need to be informed of the progress).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `52578fc603aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.