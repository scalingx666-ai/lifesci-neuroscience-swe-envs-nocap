# Issue

**Title:** Add default roundtrip encoder/decoders for dataclasses_json for:

## Description

Add default roundtrip encoder/decoders for dataclasses_json for:
- connectomics.common.file.Path
- np.in64

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23d4d17e8e80`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.