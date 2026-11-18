# Issue

**Title:** feat: new `maskData` property for `ImageStim`

## Description

PR adds a `maskData` property to `ImageStim` which exposes image mask data as a numpy array, much like `imageData` does. This allows the user to edit image mask data directly on-the-fly after image creation. Like `imageData`, any changes to the array will appear when `draw()` is called. Note that any references to the previous array before `draw()` was called will be invalidated

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b56d763f6f94`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.