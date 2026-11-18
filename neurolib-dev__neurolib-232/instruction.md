# Issue

**Title:** fixed bug in fhn, hopf, wc, ww models: copy params

## Description

x_ou, y_ou and exc_ou, inh_ou variables overwrite corresponding params, include ".copy()" to fix this

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `846c3f7925fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.