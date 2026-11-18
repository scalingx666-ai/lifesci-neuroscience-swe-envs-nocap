# Issue

**Title:** BUG: Preserve render-pass lists during MIP initialization

## Description

MIP and MinIP volume rendering can leak render passes and their graphics resources, causing Slicer to exit with a leak error.

VTK emits `ModifiedEvent` while creating the empty `RenderPasses` list, before `Append` inserts the pass. Slicer’s callback removes that empty list even when it has not removed an SSAO pass, invalidating the append and leaving references unbalanced.

Only remove an empty list when the callback actually removed an SSAO pass.

Adds a regression test that failed before and passed after this fix.

Confirmed that other volume rendering tests pass.

Related to #7560 (which introduced the callback being corrected here)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b2ad9d5ff8c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.