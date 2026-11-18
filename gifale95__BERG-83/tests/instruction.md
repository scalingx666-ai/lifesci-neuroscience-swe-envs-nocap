# Issue

**Title:** Fixes Bug Introduced in Previous Merge of Text2fMRI

## Description

Sorry for noticing this bug after the code was merged. But using the model variant doesn't actually change the config from the default config, so it still loads the default model. Here I have fixed it. I also noticed an error in the documentation. Fixed it too. 

Btw, there are now two models to choose from.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f19283a9bef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.