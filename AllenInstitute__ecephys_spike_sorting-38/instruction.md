# Issue

**Title:** Add spike_templates to load_kilosort_data

## Description

Also removes appended "_r" from kilosort_postprocessing output files, so these files can be used by downstream modules.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `080a951e2d87`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.