# Issue

**Title:** COMP: Update CTK to fix crash in multi-threaded DICOM decoding

## Description

Updates CTK to include commontk/CTK#1462, which fixes a crash in `ctkDICOMItem::Decode` when it is called from multiple threads. Parallel DICOM indexing calls it this way.

```
$ git shortlog 0d63a39f9d7c58e9b840d861f75e079434fc71b7..d3a09b063cd3353ae7304b8604ed83632013a909
Andras Lasso (1):
      BUG: Fix crash in ctkDICOMItem::Decode when called from multiple threads
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0eda87be2611`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.