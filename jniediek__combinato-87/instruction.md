# Issue

**Title:** Enable merging of artifact cluster

## Description

This PR allows the artifact cluster to be merged with other clusters. This simplifies the handling of sessions with many artifacts by enabling direct merging instead of manually marking groups.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `999b63116163`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.