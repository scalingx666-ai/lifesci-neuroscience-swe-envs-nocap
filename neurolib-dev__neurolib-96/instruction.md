# Issue

**Title:** BOLD overflow fix; dfEvolution fix / enhancement

## Description

* Fix BOLD overflow bug.
* Fix `drop_duplicates` bug in `dfEvolution`.
* Add `.outputs` to `dfEvolution` and `dfPop`.
* Rechecked the Balloon-Windkessel model equations and all constants. Everything fine.

Don't know if we should do this PR before or after Multimodel, don't want to cause havoc 🍡 

Todo:
* [x] Edit evolution notebooks to use `.outputs` functionality at least somewhere. Was implemented before but never used.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16a426477c52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.