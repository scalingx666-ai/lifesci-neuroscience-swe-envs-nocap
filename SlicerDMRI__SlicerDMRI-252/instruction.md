# Issue

**Title:** ENH: Refactor TractCloud module to use standalone tractcloud package

## Description

Replace the embedded TractCloudLib with the pip-installable tractcloud package (github.com/SlicerDMRI/TractCloud, inference-cli branch). The Slicer module is now a thin wrapper that:

- Installs the tractcloud package automatically on first use
- Runs inference as a QProcess subprocess (non-blocking UI)
- Parses JSON progress from stdout for real-time status updates
- Loads per-tract VTP results into a two-level SubjectHierarchy (category folders with full anatomical names and unique colors)

The tractcloud package handles all computation: feature extraction, KNN neighbors, DGCNN inference, and output file creation. GPU is used automatically when available (17x inference speedup).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77e7018b7de5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.