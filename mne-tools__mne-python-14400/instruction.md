# Issue

**Title:** Splitting _brain.py into multiple modules (phase 3)

## Description

#### Reference issue (if any)

Third phase of #14331 and following #14393.

#### What does this implement/fix?

now Brain time viewer react to surface changes instead of `set_surf` updating it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `874535799172`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.