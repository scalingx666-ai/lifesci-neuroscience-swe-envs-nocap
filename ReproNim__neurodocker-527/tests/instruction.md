# Issue

**Title:** NEW: Add support for FSL version 6.0.6 onwards

## Description

My initial attempts at building a container image for FSL (which lead to #523) failed, as the FSL installer gets stuck to 0% during stage 2 according to the logs. I gave up and decided to spend my efforts contributing a working image for 6.0.6+ instead.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5dbe50e28312`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.