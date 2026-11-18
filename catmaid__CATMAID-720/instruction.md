# Issue

**Title:** Only load tiles within slice boundaries

## Description

When artificially zoomed, clamp tile loading within slice boundaries to prevent nonexistent tiles from being requested from the datastore. Closes acardona/CATMAID#719.

Minor note, the `Math.pow` call is unnecessary, as it always returns 1 in the current method. However it is semantically correct and necessary when `zoom` is nonzero and `mag` is nonunitary, e.g., to have arbitrary and nonintegral zoom levels.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a942cdca7380`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.