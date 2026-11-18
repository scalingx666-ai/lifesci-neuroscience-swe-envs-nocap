# Issue

**Title:** feat(TransferTask): fix bugs, increase performance, CLI updates

## Description

- Fixes confusion around `translate`
- bounds are defined in terms of the destination
- finally adds integration tests for TransferTask
- transfer_to used for the most barebones transfer possible (no downsamples, no remapping, exact match of scale and dtype information). Recompression possible.
- Adds `igneous design ds-memory` and `igneous design ds-shape` which is a calculation aid for designing the shape for a downsample or transfer.
- Adds `downsample_shape_from_memory_target` which computes the smallest shape giving the largest number of downsamples given a memory constraint in bytes.
- Integrated memory limits into TransferTask and the CLI.
- Added compresso support to the CLI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8307d5f7768b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.