# Issue

**Title:** refactor: remove JIT decoration from Euler stepping function

## Description

- Remove @partial(jit) decorator from step_euler function
- Decorator was causing compilation issues with dynamic arguments 
- Function remains functionally equivalent but allows for more flexible usage where you want to give prior distribution to your RateCells

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94f1697d69b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.