# Issue

**Title:** Add instructions for replicating functionality in SpikeInterface

## Description

The Allen Institute is in the process of migrating its spike sorting pipelines to SpikeInterface, with no plans to support `ecephys_spike_sorting` moving forward.

These changes add a recommendation for new and existing users to base their spike sorting pipelines on SpikeInterface. They also add code snippets to `README` files that demonstrate how to replicate the functionality of `ecephys_spike_sorting` in SpikeInterface.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e567a6fc3fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.