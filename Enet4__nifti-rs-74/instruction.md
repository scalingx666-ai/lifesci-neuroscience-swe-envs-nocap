# Issue

**Title:** Add the 7 optional FSL intents

## Description

- Some automatic formatting in the `use`.
- I simply added the missing intents in the enum. I don't think there's anything else to do.
- There's no documentation in the standard for those fields, so I simply rewrote the name in a human readable way.
- I wasn't sure if `FSLFNIRTDisplacementField` or `FslFnirtDisplacementField` was better...?

Fix #73

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64e011837f95`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.