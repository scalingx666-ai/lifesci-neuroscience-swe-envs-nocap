# Issue

**Title:** feat(backward): gradient disk streaming and tutorial (PR 3 of 3)

## Description

PR 3 of 3 (final) for the backward-pass first-class support sprint.

Summary:
- Adds gradient streaming to disk parallel to activation streaming.
  - New controls: save_gradients_to and keep_gradients_in_memory.
  - Wires LazyActivationRef end-to-end for streamed gradients.
  - Bundle save/load round-trips backward data, GradFnLog/GradFnPassLog state, cross-references, and lazy gradients.
- Adds notebooks/backward_tutorial.ipynb covering the backward-pass patterns from PR 1, PR 2, and PR 3.
- Sprint complete; remaining deferred items stay in todos.md parking lot.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f9f0b17da93b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.