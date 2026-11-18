# Issue

**Title:** Fix order in channels.tsv file for motion data

## Description

This PR fixes  It ensures the order of the [`channels.tsv`](https://bids-specification.readthedocs.io/en/stable/modality-specific-files/motion.html#channels-description-_channelstsv) file for motion data is as expected to pass the validator.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b376d5c11c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.