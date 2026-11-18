# Issue

**Title:** [MNT] - Update deprecation warning

## Description

We previously set the deprecation warning to an "always" filter, however this has unintended consequences - it voids user's own filters, so it makes the warning impossible to turn off. If running code in parallel, this can lead to it being practically impossible to stop the warning being printed multiple times, making it _very_ annoying. I think we shouldn't be over-riding users own warnings settings - so this removes the "always" filter. 

Also - bump version to rc3!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a022997f6d8d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.