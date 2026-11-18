# Issue

**Title:** feat: Use output surfaces in internal nodes

## Description

Small cleanup. We generally follow the convention of using files in the output directory in our buffers for reuse to ensure more consistency between first runs and reruns with precomputed derivatives. The `t1w_buffer` is an exception due to the complexity of that logic. There's no reason for the `surfaces_buffer` to be an exception.

This should resolve the error in #482.

Took the opportunity to mass change `# fmt:off/on` blocks into `# fmt:skip`s

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d29e49c36534`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.