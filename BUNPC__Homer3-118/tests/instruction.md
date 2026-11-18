# Issue

**Title:** Export current element to SNIRF

## Description

* New GUI for exporting the currently selected element to a SNIRF file
* `.asv` added to gitignore
* Removed SnirfDraft = 3 from files produced by Homer3
* Bug fix in Hdf5Save, preventing crash on saving empty mdt and probe
* `GetAllData` interface on `ProcResultClass`, returns all properties and contents of `misc`
* `GetProbe` interface
* Remove export to script option (because it does not work at all)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4cbc6e00046e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.