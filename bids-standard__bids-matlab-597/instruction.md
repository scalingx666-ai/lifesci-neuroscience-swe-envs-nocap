# Issue

**Title:** Incorporating json into bids.File (issues #596 #371)

## Description

First draft to incorporating managing sidecar into `bids.File` class.

@Remi-Gau , Is it better to use the `bids.File` class directly or use a daughter class extending functionality?

Todo:
 - [x] lint
 - [x] tests
 - [x] docs
 - [x] Decide if create new class `bids.JSONFile`or use the `bids.File`
 - [ ] Add path management to `Sources` and `Raw`. BIDS requires path starting from root of dataset

---

-  
-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `10baa5de2312`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.