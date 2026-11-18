# Issue

**Title:** feat: add skeleton xfer

## Description

sharded -> sharded
unsharded -> unsharded
unsharded -> sharded
no support for sharded -> unsharded (though probably useful for
regaining random writes...)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `681639587816`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.