# Issue

**Title:** Fix motif lifecycle and edgelist ingest

## Description

This cleans up a few rough edges around replacing, saving, loading, and ingesting motifs.

- makes `from_nx()` fully replace old parsed state and work with multigraph edges
- keeps caller-owned streams open while still closing files opened from paths
- accepts path-like objects in save/load
- applies endpoint dtypes consistently for file and DataFrame inputs
- rejects missing endpoint IDs instead of turning them into bogus graph nodes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17c5779cbfcc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.