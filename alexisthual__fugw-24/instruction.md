# Issue

**Title:** Bugfix/wasserstein scaling

## Description

Fix unfortunate bug I probably introduced a while ago when doing some refactoring.
The wasserstein component had reduced importance (factor 2) compared to the gromov-wasserstein component all along.
It is probably not of major importance as our solver seems very robust to changing hyper-parameters, but still...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `02c579a21cf2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.