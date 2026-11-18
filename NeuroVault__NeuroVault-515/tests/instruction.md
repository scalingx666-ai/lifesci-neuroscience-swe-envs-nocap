# Issue

**Title:** NIDM related API enhacements

## Description

- added /api/collections/{pk}/nidm_results GET path
- added /api/collections/{pk}/atlases GET path
- added nidm_results_ttl field in NDIM results statistic map

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e4f363fdefa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.