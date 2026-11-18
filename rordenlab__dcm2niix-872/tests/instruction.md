# Issue

**Title:** refactor file handling in WASM wrapper

## Description

This PR refactors the file handling in the JavaScript wrapper to allow similar behaviour when files come from `<input>` html elements using `webkitdirectory` and when files come from users drag and drop events where the files will be from `event.dataTransfer.items`. 

Unfortunately, the latter case requires some custom event handling by the downstream developer to recursively read files from directories. 

We have this same constraint in Niivue, but we attach event handlers directly to the canvas element there. In the case of `dcm2niix`, it does not care about html elements or their events, so that handling has to be taken care of prior to passing files in. 

The changes in this PR make that process slightly less painful though. 

two new methods on the `Dcm2niix` class are available:
- `inputFromWebkitDirectory`
- `inputFromDropItems`
- also: file from `event.dataTransfer.items` (i.e. dropped files) must have the custom property `_webkitRelativePath` appended. 

This all works, and is demonstrated in the live demo here: https://niivue.github.io/niivue-dcm2niix/

and in the demo web app repo here: https://github.com/niivue/niivue-dcm2niix

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d633868a124d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.