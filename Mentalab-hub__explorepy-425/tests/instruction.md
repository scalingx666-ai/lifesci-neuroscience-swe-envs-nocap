# Issue

**Title:** Asr testing

## Description

This PR adds a module to perform ASR on data (using the eegprep library) as well as an example script to showcase and compare cleaning performance.

The ASR processor module can...
- record, filter and clean calibration data
- filter and clean raw ExG data based on calibration data in real-time
- set cleaning cutoff as well as refresh period for cleaning passes

The actual cleaning logic is entirely eegprep, the asr_pipeline.py method is based on eegprep's clean_asr but re-uses a state set from previously collected calibration data to allow for faster passes.

The example script implements a sort of matrix test to compare data cleaned (or not cleaned) with various parameters.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bbe1cf5706e7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.