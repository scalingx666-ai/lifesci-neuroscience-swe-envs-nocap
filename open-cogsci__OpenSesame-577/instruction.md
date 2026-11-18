# Issue

**Title:** add useRetina param for psychopy; fix UI disactivation

## Description

Some fixes to make the upcoming OS 3.2 release work on the Mac.

- UI is now disabled when running an experiment, with the exception of the kill button (just like on the other platforms).
- the `useRetina` parameter has been added to the psychopy init_window function. This does not really do anything for the currently used version of psychopy (or rather pyglet), but will become important when these modules get updated in the future. I prefer to explicitly mention it already so it can easily be changed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f4db164cffee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.