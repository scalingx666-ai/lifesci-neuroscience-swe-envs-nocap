# Issue

**Title:** Enforce LF line endings in .gitattributes

## Description

Set `eol=lf` alongside `* text=auto` in `.gitattributes` so text files are checked out with LF line endings on Windows even when `core.autocrlf=true`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc018ad5b7d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.