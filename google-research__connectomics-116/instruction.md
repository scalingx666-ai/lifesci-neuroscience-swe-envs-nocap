# Issue

**Title:** - Convert EstimateFlow to use Dataclasses as a configuration parameter, and update pipelines to support.

## Description

- Convert EstimateFlow to use Dataclasses as a configuration parameter, and update pipelines to support.
- Bugfix: Adjust EstimateFlow's overlap + expected bounding box to account for the internal stride, resulting in output that no longer overlaps. This overlap caused a significant performance hit while writing distributed volumes with TensorStore.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `49ba7640feb1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.