# Issue

**Title:** Proper handling of VOI specifications when fetching across neuroglancer fragment volumes

## Description

When fetching from a multi-fragment neuroglancer provider with a voi, the current implementation returned a full-size but almost empty volume. This PR tries to fix the problem, and had to address a couple of  downstream issues with neuroglancer fetching.

It needs testing and independent review...

The design of neuroglancer volumes, scales, providers etc. appears overcomplicated and makes it difficult to solve this elegantly, but solving the higher level design will be part of siibra-python v2.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bed542ae0ef5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.