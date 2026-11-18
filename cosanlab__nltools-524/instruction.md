# Issue

**Title:** docs: consolidate the Adjacency tutorials into one notebook

## Description

Part of #505. Third of the eight consolidated tutorials.

## What changes

- `docs/tutorials/data-operations/03_adjacency.py` (412 lines, one output per cell) replaces `data-operations/06_adjacency.py` and `basics/03_adjacency.py`. Seven sections: create one, plot, threshold and transform, arithmetic and statistics, regression, multidimensional scaling, graphs. Representational similarity analysis is left to the similarity-and-RSA tutorial.
- Claims inherited from the sources were checked against the code and corrected, among them: `threshold(lower=, upper=)` direction (the old basics notebook had it inverted); `distance()` uses scipy's `cdist`; a flat vector needs a `*_flat` matrix type; directed matrices are stored in full; `regress` returns a six-key dict, adds no intercept and returns plain arrays for a stacked response; `to_graph` merges nodes that share a label, so the page uses distinct labels and says so.
- Nav: "Working with Adjacency" as the third flat entry under Tutorials; the notebook joins `TUTORIAL_GLOBS`, `tutorials-check` and `tutorials-run`.

## Noted

The parked `analysis/04_similarity.py` links the deleted `06_adjacency.md`; it is not built and gets repointed when the similarity tutorial is consolidated.

## Checks

`uv run poe tutorials-check`, `uv run poe docs-build` (28 s, three pages executed), `uv run poe ok` (1000 passed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ef95a9707978`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.