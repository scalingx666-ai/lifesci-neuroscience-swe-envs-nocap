# Issue

**Title:** chore: remove probe.py/probe2.py debugging scratch files

## Description

Leftovers from debugging #204; the dotted-name link cases they exercised
are already covered in tests/test_lint.py.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `33ce8ce444b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.