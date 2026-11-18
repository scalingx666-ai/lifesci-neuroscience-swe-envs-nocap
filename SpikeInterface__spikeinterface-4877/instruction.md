# Issue

**Title:** Make motion-corrected and silenced recordings JSON-serializable

## Description

This makes `InterpolateMotionRecording` (what `correct_motion` returns) and `SilencedPeriodsRecording` JSON-serializable, so chains that include them no longer have to be saved as pickles. Writing them to JSON already worked, but they could not be reloaded.

I looked into the git history and found no rationale for making them pickle-only. The motion opt-out was added in #3341 as a temporary fix for #3313, and the silence periods one in #4539 without discussion. I am doing this now because of the zarr v3 support in #4260: making these recordings JSON-serializable will make that transition easier, see my review there ().

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `36dc59320bd5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.