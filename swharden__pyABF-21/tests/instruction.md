# Issue

**Title:** Epochs: Warn on custom waveforms

## Description

These are currently not supported so we also warn the user in addition
to setting the sweepC array to NaN.

I plan on adding support for reading custom waveforms from ATF files. I'll send a follow up PR once that is done.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `407a1a4dc676`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.