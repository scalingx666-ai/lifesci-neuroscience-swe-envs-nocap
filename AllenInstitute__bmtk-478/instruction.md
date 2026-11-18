# Issue

**Title:** DPointNet: V100 LGN GPU compatibility + SONATA compression

## Description

Include SM70 in the existing bounded GPU spatial filtering and non-XLA firing-rate route. Add architecture and dispatch regressions and document the Pascal/Volta compatibility scope.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e78ec81a233`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.