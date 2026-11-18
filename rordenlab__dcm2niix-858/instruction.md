# Issue

**Title:** webkitRelativePath workaround for safari and allow nested directories

## Description

This PR enables dcm2niix in Safari.

- Safari strips `webkitRelativePath` when sending files to the web worker, so this property was empty and causing failures.
- implemented workaround to get the `webkitRelativePath` prior to sending to the web worker. Also use `name` as fallback if needed
- Now `dcm2niix` WASM works in Safari, Firefox, and Chrome. Multiple nested dicom directories are also now supported due to this `webkitRelativePath` fix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fda03a5b5cfd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.