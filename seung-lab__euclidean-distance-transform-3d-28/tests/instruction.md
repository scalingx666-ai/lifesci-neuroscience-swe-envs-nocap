# Issue

**Title:** feat: edt with voxel connectivity graph

## Description

This enables touching voxel groups to be treated as separated, for example, because the shape gives away the nature of the object but the resolution or viewing angle is not sufficient to induce a gap.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b0d83fa2ead8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.