# Issue

**Title:** precompilation

## Description

Reduces TTFX for the 4 models defined in the precompilation block from ~45s to <4s.
Lot's of recompilation though, not sure where this is coming from.

- **removed duplicated function**
- **make link checker happy**
- **make linter happy**
- **generalized the test**
- **added packages to top**
- **added precompilation**

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cc8773141e44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.