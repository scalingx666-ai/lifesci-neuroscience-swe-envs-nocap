# Issue

**Title:** Noleak and faster speed

## Description

This is a fix to a leak is sequential Conv Output layer. The fix 

1. rewrites the `processTensorInChunks` function to use convolutions (although the one we had before may have also worked, but that's history)
2. reinforces this function and the class with additional tidy and scope operators, as well as encourages webgl to free the buffers as soon as possible
3. It also changes the delay between the class values computations so that webgl has time to clean up - and indeed it now has it
4. This is probably the most important change - the fix enforces 16bit textures, which significantly speeds up execution without visible change in performance

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `530eecb529c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.