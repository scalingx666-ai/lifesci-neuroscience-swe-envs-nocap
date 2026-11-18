# Issue

**Title:** Fix: do not use `set_times` in  OpenEphys timestamps loading (and load as memmap)

## Description

After #4671, the `set_times` function makes timestamps be dumped to dict. The only reader that was setting times with `set_times` was the Open Ephys reader.

This PR directly sets the segment's time vector and further loads the timestamps in read memmap mode.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d5080fb9fd17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.