# Issue

**Title:** rf: Separate fieldmap registration from coreg ref generation

## Description

Porting  over.

This should have no impact on the workflow structure for full runs, but allows runs with precomputed derivatives to display SDC reports. I therefore think this should be a patch candidate.

@mgxd Could you have a look? I'm happy to port this over to nibabies as well.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f3d29b19959`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.