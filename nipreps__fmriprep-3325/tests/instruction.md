# Issue

**Title:** fix(doc-build): Address errors/warnings in RTD builds

## Description

* sphinx-argparse v0.5.0 broke our builds, so blacklist: 
* Backport some fixes from #3312.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2363568907b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.