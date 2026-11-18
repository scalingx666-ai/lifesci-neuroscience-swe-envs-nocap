# Issue

**Title:** Remove duplicated `get_recording_property` and `get_sorting_property`

## Description

We duplicated the `get_recording_property` and `get_sorting_property` methods in the `SortingAnalyzer` class. At the moment, the analyzer uses the ones deleted here - meaning a user can't pass `ids` to the methods! Oops!

Other methods here:
https://github.com/SpikeInterface/spikeinterface/blob/9b91b4aac01d07a9b367a32b424f0de47bcf33a8/src/spikeinterface/core/sortinganalyzer.py#L1335

and here:
https://github.com/SpikeInterface/spikeinterface/blob/9b91b4aac01d07a9b367a32b424f0de47bcf33a8/src/spikeinterface/core/sortinganalyzer.py#L1365

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b91b4aac01d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.