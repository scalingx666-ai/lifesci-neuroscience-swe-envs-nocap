# Issue

**Title:** Development

## Description

- Improve codes for detecting GE non-DTI
- Limit maxEchoNumGE warning for GE non-diffusion only
- Remove the warning ("Some images had bval>0 but bvec=0 (either Trace or b=0, see issue 245)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1485cc5fb280`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.