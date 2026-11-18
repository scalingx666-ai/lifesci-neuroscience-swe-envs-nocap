# Issue

**Title:** ENH - add identifiers to the message when reporting qsubget errors/warnings

## Description

I would prefer to see the line numbers of the functions that evoked the errors/warnings, but this will at least add the warn/error identifier to the message that is printed by qsubget

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `03da61d9d7d9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.