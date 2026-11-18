# Issue

**Title:** perf+refactor: faster Marching Cubes and cleaner implementation

## Description

Merging Alek's wonderful cleanup patch that also speeds up MC. It passes the tests and looks fine.

Rather, I should say that it passes on my machine. It seems that simplification has changed somehow, but that's my code's fault somewhere.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `00261190f099`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.