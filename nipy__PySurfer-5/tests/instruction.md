# Issue

**Title:** fix: updated gui inclusion for ipython 0.11

## Description

one might consider updating gui selection for ipython 0.10 as well.

however, i do think that none of this is really necessary. one can run pysurfer with ipython at all. simply use mlab.show()

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `172f810f320e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.