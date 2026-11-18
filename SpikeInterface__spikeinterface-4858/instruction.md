# Issue

**Title:** Fix probe attachment in serialization fixture builders

## Description

I got this error on #4840 (Filter one channel at a time to reduce peak memory) and decided to fix it here. When we changed `set_probe()` and `set_probegroup()` to modify the recording in place, calls without `in_place` stopped returning a recording. The fixture builders account for removing the argument but still assign the return value to `rec_with_probe`. That value is `None`, so the script fails when it tries to save the recording.

This was working before because the script uses `in_place=False` for versions up to and including 0.105.0. That release still supports the deprecated argument and returns a recording in that case. The workflow automatically selects the latest published patch of each minor version. Once 0.105.1 was published, it selected the other path in the script and exposed the incorrect return-value assumption. The in-place behavior was already present in 0.105.0. It was the version selected by the workflow that changed.

This PR keeps the original recording after attaching the probe in the newer-version paths. The older-version paths are unchanged. I checked fixture generation and all 26 round trips separately with 0.105.0 and 0.105.1, including parallel binary and Zarr writes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a4fc1dc0ec3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.