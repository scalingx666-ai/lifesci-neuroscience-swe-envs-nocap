# Issue

**Title:** fix: index template_peak_channels by cluster ID, not loop counter

## Description

In the bulk extraction loop, template_peak_channels[i] used the
sequential enumerate counter instead of the cluster ID (cid). When
dead templates create gaps in cluster IDs, this causes each subsequent
unit to read the wrong template's peak channel, writing incorrect
values to the cached .npy files.

This is the extraction-side counterpart of the helper_functions.py fix
(maxChannels[unit_idx] -> maxChannels[this_unit]).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f499781357f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.