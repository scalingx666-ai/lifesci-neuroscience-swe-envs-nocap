# Issue

**Title:** NET_RECEIVE INITIAL not vectorized translation needs set_globals_from_prop

## Description

Actually, it is needed only if the NET_RECEIVE INITIAL block references a RANGE variable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `499cea9ceda6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.