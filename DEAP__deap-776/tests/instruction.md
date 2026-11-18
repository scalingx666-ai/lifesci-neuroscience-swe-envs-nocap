# Issue

**Title:** Replace hv.hypervolume() with moocore.hypervolume() and remove C extension

## Description

This PR replaces the C/Python hypervolume implementations with the one in moocore, as discussed in #775

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1dc8d28ec06d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.