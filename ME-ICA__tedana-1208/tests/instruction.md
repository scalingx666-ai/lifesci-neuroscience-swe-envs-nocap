# Issue

**Title:** New QC measure for fit of rejected to accepted components

## Description

.

Changes proposed:
- Add function to calculate impact of rejected components on each accepted component in new file `quality_metrics.py`
- Update `component_table` and `cross_component_metrics` with this information
- Add documentation detailing this QC measure
- Add relevant tests

Thanks to @handwerkerd for contributing to this PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e7ecd67e301`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.