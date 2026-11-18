# Issue

**Title:** Add gzip JSON support and test

## Description

**Overview**
This PR adds support for loading gzip-compressed JSON files (.json.gz) in NiMARE dataset loading utilities.
Testing Context
The official NiMARE test suite could not be fully executed in my local environment due to DataFrame-related inconsistencies (e.g., issues with duplicate columns and .tolist() handling in certain cases). These issues are unrelated to the gzip functionality and prevented running the full test suite reliably.
To isolate the change and ensure correctness, I implemented a minimal, self-contained test focused specifically on gzip JSON loading.

**What was tested**

- Loading dataset from a gzip-compressed JSON file 
- Ensuring correct parsing of JSON structure 
- Verifying compatibility with existing loading logic 

**What this PR solves**

- Adds native support for .json.gz input 
- Enables users to directly load compressed datasets without manual decompression 
- Improves usability for large datasets

## Summary by Sourcery

Add support for loading gzip-compressed JSON dataset and studyset files and verify it with targeted tests.

New Features:
- Allow Dataset and Studyset loaders to read gzip-compressed JSON files with .json.gz extensions.

Enhancements:
- Tighten input validation for Studyset initialization by requiring the source to be either a file path or a dictionary.

Tests:
- Add a dedicated test that writes mock Dataset and Studyset definitions to both plain JSON and .json.gz files and verifies they load equivalently.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6e8fa5758c28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.