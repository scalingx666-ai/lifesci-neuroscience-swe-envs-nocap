# Issue

**Title:** [FIX] failing unitests for neo_tools with Neo 0.13.0

## Description

## Changes

- fixed failing unitests for `neo_tools`.
- fixed failing tests in `spike_train_synchrony`


## Background
With Neo v0.13.0  child lists (such as Segment.spiketrains, Segment.analogsignals, Block.segments, etc.) are now represented by pseudo-list objects that manage the necessary bookkeeping related to child-parent relations transparently.

See also: https://neo.readthedocs.io/en/latest/releases/0.13.0.html

This leads to  issues with unit tests in `neo_tools`, similar to the difficulties encountered with the pseudo list `SpikeTrainList` introduced with Neo version 0.10.0.

For Neo 0.10.0 this was fixed here: 

**Update**

Neo Issue  was fixed. Now it is no longer possible to add the same object to one of the collections (pseudo-lists) twice. Therefore those parts of the unit-tests that creating data in this way have been removed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dd3146c8c290`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.