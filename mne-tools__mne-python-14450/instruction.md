# Issue

**Title:** Deep source modeling (phase 2)

## Description

#### Reference issue (if any)

Following #14130

#### What does this implement/fix?

Now subcortical meshes are drawn as surfaces next to the cortex, and their colors follow the time slider and the colormap limits.

#### Additional information

Opus 5.5 helped implementing, I reviewed, did some modification and added an example.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b743f4792e10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.