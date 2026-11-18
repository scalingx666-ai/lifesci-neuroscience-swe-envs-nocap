# Issue

**Title:** Pass `main_channel_indicies` in `create_sorting_analyzer_with_existing_templates`

## Description

Our sparsity logic has slightly changed, with the introduction of `main_channel_indicies`. This PR ensures that the sparsity computation is consistent with the template main_channel_indicies when you `create_sorting_analyzer_with_existing_templates`. Was causing bugs when running lupin.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dbe2e7539ab6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.