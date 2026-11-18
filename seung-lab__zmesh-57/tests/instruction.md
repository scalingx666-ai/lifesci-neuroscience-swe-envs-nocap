# Issue

**Title:** perf: faster equality check for marching cubes

## Description

This is kind of ugly, but it has an interesting principle. It exploits the sliding window property to skip some equality checks.

When the front of the 2x2x2 cube is not solid-color, when it slides backwards to the rear, the solid color check will certainly fail the next iteration.

This improves performance about 5%.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad0d84bfdd05`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.