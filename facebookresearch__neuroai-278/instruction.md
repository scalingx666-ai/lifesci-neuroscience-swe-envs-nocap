# Issue

**Title:** Clear the success_writer marker before an overwrite re-run

## Description

An `overwrite` re-run left the existing marker on disk while the guarded block ran
again, so a re-run that died partway left the marker behind and the next call skipped
the work and accepted half-written output.

The marker is now cleared before the block runs and only rewritten once it returns.
Behavior without `overwrite` is unchanged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2bdb6cb586d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.