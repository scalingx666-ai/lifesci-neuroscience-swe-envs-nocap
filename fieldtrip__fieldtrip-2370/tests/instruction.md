# Issue

**Title:** Check multiple elements in string of dataset_description field

## Description

The `cfg.dataset_description` fields `'Authors', 'Funding', 'EthicsApprovals', 'ReferencesAndLinks'` should be specified as an array of strings of multiple elements are defined (such as multiple authors).

Currently, the `fix_dataset_description` in `data2bids.m` change this field from a character type to array, but does not check the content.

This PR implements a check of the string content. If multiple elements are given in a single string, it will coerce them into individual array elements. The check assumes naïvely that if semi-colon delimination is not used, then commas are used to separate elements.

@robertoostenveld please let me know what you think. I have not added any warnings or tests (yet).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b92cfc044dd7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.