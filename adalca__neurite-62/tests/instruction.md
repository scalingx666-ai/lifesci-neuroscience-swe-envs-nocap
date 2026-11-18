# Issue

**Title:** Make version-checking compatible with updated Packaging library.

## Description

Recently the `packaging` library removed the `LegacyVersion` class [1]. This has resulted in Neurite's `setup.py` script throwing the following error at installation time:
`AttributeError: module 'packaging.version' has no attribute 'LegacyVersion'`

Proposed fix: 
Instead of checking if the (parsed) `version` string is a `LegacyVersion` object, use the `packaging.version.parse(version)` function to parse the `version` string and catch any `InvalidVersion` exception. If an exception is raised, then its not a valid `version` string according to the PEP 440 specification.

[1]

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7830b5d6edcc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.