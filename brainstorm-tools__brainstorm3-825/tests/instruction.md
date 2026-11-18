# Issue

**Title:** Mesh stats for surfaces

## Description

This PR introduces a new function, [tess_meshstats](https://github.com/brainstorm-tools/brainstorm3/compare/master...tmedani:meshStatsForSurfaces?expand=1#diff-739e720488d81bcdceeb20b6c4b075eeffe647f6d5d941d98881b12112a8ab03), adapted from [fem_meshstats](https://github.com/brainstorm-tools/brainstorm3/blob/master/toolbox/anatomy/fem_meshstats.m), to support surface meshes. This new function provides comprehensive geometric statistics for surface models, enabling easier comparison between meshes, particularly useful after post-processing steps such as smoothing or decimation.

Key Changes

Added: tess_meshstats function for computing surface mesh statistics.

Replaces previous function calls across all relevant menu options.

Supports use cases like mesh comparison and quality control after surface editing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae1a28f76abb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.