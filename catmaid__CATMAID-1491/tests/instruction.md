# Issue

**Title:** Treenode viewer and treenode table improvements

## Description

Thanks to #1476, the treenode viewer was all of 72 lines...

The changes to the treenode table were a bit more significant, although that's largely because I took the opportunity to port it over to the datatables 1.10 API and tidy up some jQuery. I also added the ability to filter on node confidence, creator and reviewer - valuable for checking a beginner's unreviewed ends, for example.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb88af212ed9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.