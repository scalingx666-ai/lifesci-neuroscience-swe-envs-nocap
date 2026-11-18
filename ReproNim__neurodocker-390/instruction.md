# Issue

**Title:** [ENH] update docker+singularity builders for pytest

## Description

This pull request 

- proposes modularizing the functions used to build and run containers. This is a common procedure in the tests, so it makes sense to write it once and reference throughout the tests. This allows us to condense a lot of test code...
- introduces a `PathType` object in the renderers module for use in renderer methods that operate on paths.
- tests JSON round-trip with standard input.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d794f132a0f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.