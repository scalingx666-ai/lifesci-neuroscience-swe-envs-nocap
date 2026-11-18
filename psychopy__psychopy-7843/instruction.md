# Issue

**Title:** test: add tests for `MovieStim` component in actual builder experiments

## Description

Adds regression tests for movies in an actual builder experiments. Tests whether the `noAudio` param works when set, whether a movie ends correctly with the routine ending and vice-versa, and checks for leaky OpenGL states from the MovieStim object that could interfere with other stimuli drawing correctly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b90b274f539`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.