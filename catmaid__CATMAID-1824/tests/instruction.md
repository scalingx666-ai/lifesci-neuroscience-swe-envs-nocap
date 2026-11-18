# Issue

**Title:** Typing: More low-hanging typing fruit, found some bugs

## Description

Working through some more applications/catmaid/control/ components working to get mypy at least minimally happy with them. Fixed some issues with their imports, found a few python2-isms and other issues.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c609f39c761a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.