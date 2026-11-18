# Issue

**Title:** Model selection in specparam and SPRiNT

## Description

Additions and modifications to implement model selection in specparam and SPRiNT. 

Also removes GUI options for peak types. These were always experimental but can be slowly phased out as they are no longer being studied and have not been extensively validated (nor used in an article). Instead, users can select between default optimization settings (conventional implementations) and model selection (experimental).

~~This build still generates warnings when either the user does not possess the parallel processing toolbox or on first use of either specparam or SPRiNT. In this way, it is **not** ready to be merged quite yet. However, algorithm behaviour is as expected.~~

Tutorial: https://neuroimage.usc.edu/brainstorm/Tutorials/Fooof#Model-selection_.28ms-specparam.29

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e6b3712af7c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.