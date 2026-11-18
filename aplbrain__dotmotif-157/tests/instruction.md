# Issue

**Title:** Fix NetworkX motif matching correctness

## Description

A few NetworkX edge cases were doing the wrong thing (or just blowing up), so this cleans those up in one pass.

- makes `ignore_direction=True` work with directed host graphs
- keeps negative-only motifs from losing their node mappings
- checks only the actual parallel edges for multigraph constraints
- filters matches as they are produced and stops once the limit is reached

The CI matrix also drops Python 3.9 and now installs the locked dev environment instead of grabbing whatever the newest Ruff happens to be.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc4a9aef5f50`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.