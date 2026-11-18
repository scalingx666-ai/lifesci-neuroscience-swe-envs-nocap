# Issue

**Title:** Auto-detect EEG cap landmarks from ChannelFile

## Description

Update GetEegCapLandmarkLabels to accept a channel file/folder and auto-compute landmark electrode names from channel locations (using in_bst_channel and Channel.Loc).

The function now returns top, left, right, front, and posterior electrodes when a ChannelFile is provided, and falls back to the existing hard-coded cap name cases otherwise. (this secon part can be removed)

Update panel_digitize_2024 to call GetEegCapLandmarkLabels with the montage ChannelFile (old Name-based calls are commented out) so tooltips, montage addition, and acquisition checks use the dynamic landmark detection.

Not sure if we need to update the panel_digitize as well.

@rcassani this is related tto our discussion at the meeting.
@chinmaychinara91 you can work on top of this for the next steps

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d6955c02990d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.