# Issue

**Title:** Parameter pass through for class -> function wrapper

## Description

Hey all, I think this option proposed by @grahamfindlay is fine for at least the extractor class -> extractor function. I'm not sure how we will deal with Chris' wrapper, but this is cheap typing magic so low cost to just add if it allows more language servers to understand our code. 

Partially in support of #4319.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf369c3bc119`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.