# Issue

**Title:** Create SortingAnalyzer object directly during create_sorting_analyzer

## Description

Three changes (separated in 3 commits):
* Drop support for analyzers without settings.json file. Comment says support will be dropped in "0.102.0/0.103.0" so seems due.
* Check all required input files are present before trying to load a sorting analyzer.
* Create a SortingAnalyzer object directly as the last step of create_binary_folder/create_zarr rather than re-reloading it
               
Last one might be the more contentious change. I imagine the reloading during the creation was there to make sure everything could be reloaded fine but everything in the folder is already in memory during create_*() so there isn't really a need to save and reload them into memory, it seems more logical to create the SortingAnalyzer right away.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8a27a2561956`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.