# Issue

**Title:** Allow for `main_channel_indices` to use rec attributes

## Description

A sorting has `main_channel_ids`, while an analyzer has `main_channel_indices`.

To do go from ids to indices the analyzer must, on creation or load, have access to the channel ids to indices map. On load, we were getting this from the recording attached to the analyzer. But often the recording becomes unattached to the analyzer. There is a more robust way to get this map: through the `rec_attributes` of the analyzer. This PR allows the analyzer to use `rec_attributes`!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c8eb9ab65442`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.