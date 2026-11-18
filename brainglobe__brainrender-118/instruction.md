# Issue

**Title:** Adding scale option for screenshots

## Description

A bit of restructuring of the screenshooting function. Main feature is exposing the scale option for the rendering, to allow to increase image above screen resolution. With it, some refactoring to add options to specify folder and file name after `Scene` instantiation.

I would actually get rid of the global `DEFAULT_SCREENSHOT_NAME` parameter, unless I am missing a clear usage case. Having `DEFAULT_SCREENSHOT_FOLDER` would be more useful; before it was handled with some I guess outdated `atlas.output_screenshot_folder` or something like that, but it should be a default parameter together with the others no?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35733a1c6554`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.