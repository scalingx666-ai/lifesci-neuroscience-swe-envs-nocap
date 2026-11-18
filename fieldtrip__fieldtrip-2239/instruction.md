# Issue

**Title:** Update write_brainvision_eeg.m

## Description

A rounding error caused future calculated sampling rate to not be an integer when calculating back to hdr.Fs or importing into EEGLAB srate.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1a532a966df7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.