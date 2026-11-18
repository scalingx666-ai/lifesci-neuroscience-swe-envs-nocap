# Issue

**Title:** Add a convenient build script

## Description

@juhuntenburg has requested that I PR the version of the build script we wrote together at the OHBM hackathon. This won't pass CI, but Julia has some modifications to make it pass again :smile: 

The original work: https://github.com/piloubazin/cbstools-public/compare/2c58645...kofalt:c2187eb

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ca9603ca30f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.