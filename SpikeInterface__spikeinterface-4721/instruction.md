# Issue

**Title:** fix: preserve caller-owned inputs

## Description

A constructor writes derived metadata into caller-owned input objects. This caused the failure reported in .

This change keeps channel aggregation input recordings unchanged.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2df7386822b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.