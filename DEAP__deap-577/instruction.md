# Issue

**Title:** Use raw docstrings when LaTex is embedded

## Description

Precisely what the title says. Avoids invalid escape sequence related warnings in Python 3.7 and onwards. See https://lwn.net/Articles/795546/ for further reference.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f4b77759897d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.