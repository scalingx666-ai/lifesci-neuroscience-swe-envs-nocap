# Issue

**Title:** Harm

## Description

Inclusion of HARM-GP in DEAP. As it is implemented as an algorithm, maybe the function should be called eaHarm instead of harm, but I'm not sure about it. Also added a simple example (still, it could be worthwhile to write a section in the documentation about this feature).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `daf8c1c8776f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.