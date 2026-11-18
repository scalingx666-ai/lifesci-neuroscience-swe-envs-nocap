# Issue

**Title:** add set_index_percentage for playback board and fix synthetic board

## Description

it allows to set a percentage instead absolute value. Percentage is better because for absolute values also need to design the api to get max value for each preset and api to set index should be per preset(playbackfile) while using percentage we can set index for all presets at once and do not need to add api to get size of playback file.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f19e7358adf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.