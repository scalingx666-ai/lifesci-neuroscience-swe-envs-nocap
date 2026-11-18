# Issue

**Title:** Re-add connected to GUI options

## Description

Hi! I noticed that "connected" was dropped from the GUI menu even though it's still in the docs. This seems to be related to  since sparse_mode and connected were both removed in the same commit here f2fd46be09ecb888790bdb8d5cda7b4023a99fd4.

In any case, I wanted the option back, so this is a PR to do that, in case anyone else does too :)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9808ecaf8985`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.