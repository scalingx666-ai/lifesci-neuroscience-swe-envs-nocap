# Issue

**Title:** Exclude background from connected_components

## Description

The `commons.connected_components` always returned at least two components - the background and the actual foreground structure. Of course the background is not desired. This PR excludes it.

I am quite sure that earlier siibra versions did not include the background component.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a425c2ea0b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.