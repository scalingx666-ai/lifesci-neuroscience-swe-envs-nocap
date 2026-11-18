# Issue

**Title:** Implementation of transparent unfilled ellipses for psycho backend

## Description

This seems to do the trick for the *psycho* backend: transparent ellipses. Basically, I draw a PIL image, and use that as the mask for a PsychoPy GratingStim.

There's no antialiasing, so it looks a bit blocky. But my attempt at antialiasing (creating an image 4× too large and then resizing down with an antialias filter) looked a bit weird too.

![image](https://cloud.githubusercontent.com/assets/594936/21608047/5795caf6-d1ba-11e6-8dea-43d57b51c4c8.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6cc347d90dde`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.