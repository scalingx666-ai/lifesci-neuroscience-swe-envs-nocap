# Issue

**Title:** Fixed freeview command and added warning for missing subject scripts dir

## Description

• Changed $SUBJECT calls to $SUBJECTNAME in the freeview command
• Added a warning for a missing local ./scripts directory in $SUBJECT/$SUBJECTNAME, which could potentially cause logging errors

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6cae4d4307e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.