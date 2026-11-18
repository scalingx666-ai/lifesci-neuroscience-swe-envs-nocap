# Issue

**Title:** TVB-3144. Fix parsing of parameters for PSE

## Description

The parsing was correct for to-level parameters like "conduction_speed", but wrong for composed parameters as in "coupling.a"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5467cb112644`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.