# Issue

**Title:** Add `main_channel_id` when running Kilosort

## Description

Starts work on 

We recently added the sorting property `main_channel_id` and the analyzer property `main_channel_index` which allows sorters to tell us which channel each unit is localized on.

It would be great to get this information from each sorter when it's run. Doing so means: 1) we don't need to guess the main channel => the results should be closer to the original sorter output 2) we can do an almost-instantaneous sparsity calculation.

But no external sorters actually give us the `main_channel_id` yet. One way to overcome this is to guess the `main_channel_id` straight after the sorting has completed (i.e. the end of `run_sorter`). At this point, we have access to whatever the sorter outputs, and we still have access to the recording. This PR implements that option.

One downside of this option is that we usually don't touch the `sorter_output` folder: that's usually just what the sorter outputs. I think this is the first time (for kilosort at least) that we're _adding_ some additional information.

Other possible options:
  - we shouldn't guess the `main_channel_id` unless the sorter tells us what it is
  - we should guess it on load (difficult: we don't have access to the recording)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `06abf015465a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.