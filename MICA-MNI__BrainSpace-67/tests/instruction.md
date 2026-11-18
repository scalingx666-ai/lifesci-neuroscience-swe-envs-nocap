# Issue

**Title:** [ENH] Add warning for missing display

## Description

This PR adds a warning for missing displays that may cause `plot_hemispheres` to crash. The warning links to issue #66 for a potential workaround. This warning does not function on Windows as I don't know what the analogue to the macOS/Linux `DISPLAY` environment variable is.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34835e190d32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.