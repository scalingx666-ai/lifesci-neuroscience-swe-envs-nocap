# Issue

**Title:** FIX: annotations and bgcolor

## Description

.

Works around a `nibabel` bug and actually should slightly improve the `borders` functionality by setting the transparent color better (to the brain background with alpha 0 instead of black with alpha 0, which helps with transitions).

@fliem can you see if this fixes your problem?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `55bfb4e587df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.