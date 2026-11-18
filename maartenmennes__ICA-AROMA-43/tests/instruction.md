# Issue

**Title:** ENH: Allow new ``-noplots`` option to skip ``classification_plot``

## Description

We are experiencing degraded reliability within fMRIPrep stemming from errors in the classification plot. Since we do not use them, this adds the possibility to skip the step from the command line.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ea166b937f7a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.