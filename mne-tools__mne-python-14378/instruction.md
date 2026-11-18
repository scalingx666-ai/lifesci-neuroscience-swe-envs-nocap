# Issue

**Title:** Fix reconstruction origin

## Description

When `evoked.plot(..., reconstruct="proj")` is used, we call just `evoked.reconstruct_proj()` when really we should make use of the `sphere` a user may have passed to `evoked.plot`. Includes a little AGENTS tweak because I realized we didn't suggest to verify TDD-ness of tests.

Changes drafted with Claude Opus 5.5, iterated on reviewed and understood by me. This is a trivial fix I think so I'll self-mark for merge-when-green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `55477b7ca6e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.