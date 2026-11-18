# Issue

**Title:** fix: hygiene sweep slice D — Adjacency and similarity

## Description

Slice S-D of the 0.6.0 hygiene sweep (#535): Adjacency, its plotting module and the similarity algorithms. Every finding was reproduced before it was fixed; each behavioural change carries the test that failed on master.

Findings fixed (ids from the #535 tracker): D-01, D-02, D-03, D-04, D-05, D-06, D-07, D-08, D-09, D-10, D-11, D-12, D-13.

Behavioural:
- The social relations model pairs each dyad with its reciprocal entry; variance components now match the textbook formula and are invariant under a joint row/column permutation (verified against an independent implementation; the Kenny fixture is unchanged). Its grand mean and effect arrays no longer include the diagonal, and the two-tailed reciprocity p-value is two-sided.
- Bootstrap resamples matrices, not edges, and requires at least two matrices.
- A declared-directed matrix keeps its kind through permutation; the permutation generator no longer reclassifies or raises on a symmetric draw.
- `plot(limit=1)` and singleton stacks draw; supplied axes are used rather than the current figure; label-distance heatmaps resolve integer, boolean and string labels (polars stringifies pivot columns).
- `similarity` reads a flat comparison array as the same kind of matrix as `self`.
- Similarity helpers: Euclidean and correlation paths agree with the hand computation on the sign convention.

Mechanical: `to_graph` and `write` helpers deduplicated; two spec sentences added to `development/specs/adjacency.md`.

Migration rows: six.

Gates: `uv run poe ok` after rebase onto c85e2411, the touched test files at `-m ''`, strict docs build. The #527/#529 plotting behaviours (divergent colormap, diagonal semantics, `plot_stacked`) are untouched.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c85e2411b96a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.