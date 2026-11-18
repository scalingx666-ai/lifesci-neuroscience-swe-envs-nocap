# Issue

**Title:** [Nirs] export channels.tsv

## Description

This is another part of the BIDS export PR. i separated it from the main PR to be easier to review and merge. 
The goal of this PR is to import/export channels.tsv file from Brainstorm

The description of the file can be found here: https://bids-specification.readthedocs.io/en/stable/modality-specific-files/near-infrared-spectroscopy.html#channels-description-_channelstsv


Todo: 

- [x] Handle Unit of the channels / Detect HbO, HbR HbT
- [x] Handle good/bad cannels
- [x] Add function to read channels file (requested in the forum)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e13a33d5ac3b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.