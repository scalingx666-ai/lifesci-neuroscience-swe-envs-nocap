# Issue

**Title:** polyutils: fill missing docstrings in Surface class

## Description

Adds docstrings (Parameters/Returns/Yields) to public Surface methods that were undocumented or only had a one-line summary: iter_surfedges, get_graph, weighted_distance_graph, extract_chunk, extract_geodesic_chunk, polyhedra, patches, edge_collapse. Also reformats laplace_operator's prose return description into a proper Returns block for consistency with create_biharmonic_solver.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `505a0478ba44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.