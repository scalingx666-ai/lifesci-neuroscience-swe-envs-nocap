# Issue

**Title:** feat(rdna): enable RDNA in preprocessing and profiling pipeline

## Description

## Summary

Add RDNA GPU support to GEAK's preprocessing and profiling pipeline. CDNA paths
are intentionally untouched — every RDNA-specific change is gated on
`is_rdna(detect_gpu_arch())`.

Tested end-to-end on RDNA4 gfx1201 (Navi 48).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ef30d041604`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.