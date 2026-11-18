# Issue

**Title:** BUG: Fix fileType property ignored in slicer.util.saveNode

## Description

`slicer.util.saveNode` checked whether the properties dictionary has a `fileType` *attribute* (`hasattr`) instead of a *key*, so a file type specified in the properties was always ignored and the writer was chosen automatically.

For example, `slicer.util.saveNode(node, path, {"fileType": "MyFileType"})` did not use the "MyFileType" writer.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d38aed75ec31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.