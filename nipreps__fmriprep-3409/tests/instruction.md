# Issue

**Title:** fix: Use removeprefix instead of lstrip or ternary operator

## Description

We had some `.lstrip()`s that should be `removeprefix()` as well as some pre-`removeprefix()` hacks of the form `s[len(prefix):] if s.startswith(prefix) else s`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0218f4f78cf4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.