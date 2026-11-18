# Issue

**Title:** Bug fix: Compile native binaries on Apple Silicon

## Description

Previously, it needed to be specified manually via PLATFORM=arm64
This change detects the PLATFORM automatically accordingly if it is an Intel Mac or Apple Silicon
This should solve the issue of running the tests on macos-latest

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a7c52d88a3c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.