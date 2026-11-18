# Issue

**Title:** BUG: fix Tractography Display 'Interactive Edit' feature

## Description

Partially fixes the Interactive Edit feature. There is a remaining issue: activating the edit tool requires clicking in the render window after `Enable Interactive Edit` is checked. I think this is a state issue in the interactor node, but I'm not sure how to fix that yet.

also note that, as per a comment in the code, the 's' (select) feature currently only works with color-by-scalar mode.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ca917f23c69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.