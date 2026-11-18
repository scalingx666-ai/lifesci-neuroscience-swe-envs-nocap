# Issue

**Title:** Added weight option for struct consensus

## Description

Added what I understand to be the *recommended* way to turn binary structural consensus maps into weighted maps, based on conversation with @rmarkello. The default value for the flag is `false`, so this addition won't change current behaviour.

(Please let me know if there were tests for this function that I should update, as well, but my quick `git grep` didn't find any).

Thanks!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c90795364240`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.