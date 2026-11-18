# Issue

**Title:** neuralbench: package-relative YAML includes, shared 10-20 channel mapping, mean aggregation of pooled outputs

## Description

Lets configs outside NeuralBench reuse its channel mappings, merges the duplicated 10-20 mapping, and lets mean aggregation accept already-pooled model outputs (e.g. BIOT).

- YAML `!include package:path` resolves within an installed package (relative includes unchanged), so configs outside neuralbench can reuse its channel mappings.
- The identical `bendr.json` and `biot.json` channel mappings become one `channel_mappings/standard_1020.json`.
- `DownstreamWrapper(aggregation="mean")` passes already-pooled 1D model outputs through (e.g. BIOT) instead of raising.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cb19d1e4d9e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.