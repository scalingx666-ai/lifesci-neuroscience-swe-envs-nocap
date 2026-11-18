# Issue

**Title:** MAINT: Update to macos-15-intel

## Description

`macos-13` is deprecated, so update to `macos-15-intel` for the x86_64 runner.

Since MNE-BIDS doesn't do any heavy `linalg` work or anything, I'd actually prefer just to drop `macos-15-intel` and assume upstream libs (MNE, SciPy, etc.) properly test support generalization on those archs. Thoughts?

Merge reqs will need to be updated, I'm happy to do that and merge once the above is discussed :point_up:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2adc50c1978e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.