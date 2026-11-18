# Issue

**Title:** [ENH] Add tedana support.

## Description

Adds Tedana support. The implementation is a bit gimmicky as I have to overwrite another file to insert the output into topup... but it should work. I also declared a few function variables as locals to avoid unintended side-effects.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aba58920295b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.