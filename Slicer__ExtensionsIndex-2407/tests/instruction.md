# Issue

**Title:** DRAISegmentation: track main for Slicer 5.12 builds

## Description

Update DRAISegmentation for Slicer 5.12 to track the source repository's `main` branch instead of the fixed commit `984c135`. Daily Stable builds can then pick up tested source updates without a new index PR for each commit, as suggested in  Both Stable and Preview intentionally track the same source branch.

The source branch currently includes commit `c23890d`, which updates the module's displayed name and descriptions to **DRAI Segmentation and 3D Modeling**. The extension identifier remains `DRAISegmentation`.

Validation: confirmed that the source branch exists; passed the index description validation (source checkout, schema, format, metadata, license, and dependencies) and confirmed that only `scm_revision` changes. The source update passed Python syntax and Slicer 5.6.2 module-load checks, and its UI was reviewed locally. Cloud inference was not rerun for the branding-only update.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b62359e0f7fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.