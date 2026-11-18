# Issue

**Title:** Fix psychopy text scaling and positioning.

## Description

On MacOS with retina screens, psychopy text elements are shown too small and at wrong locations. By using the value of win.size and experiment.size, I calculate a ratio with which the parameters of text items in psychopy should be corrected.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d6554f37ccf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.