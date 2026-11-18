# Issue

**Title:** Update from imio to brainglobe_utils.IO.image

## Description

This was meant to be a follow on from  but the use in brainrender was so out of date, it's essentially independent. However, this PR reflects the latest API, so needs  to pass. It will also , but that issue is unrelated to this PR.

I also updated this example slightly and removed some unnecessary code.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42c36217764d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.