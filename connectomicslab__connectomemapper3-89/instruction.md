# Issue

**Title:** ENH: Implement interfaces to support BIDS derivatives for describing parcellation nodes

## Description

This includes:

* one interface to create the TSV file specified by BIDS with index, name, color, mapping columns describing the parcellation nodes

* one interface to create CMP graphml and colorlut files from TSV files of custom parcellation in BIDS format.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a8ec2806c4e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.