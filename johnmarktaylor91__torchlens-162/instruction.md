# Issue

**Title:** feat(visualization): backward graph rendering (PR 2 of 3)

## Description

PR 2 of 3 for backward-pass first-class support sprint.\n\nSummary:\n- Adds model_log.show_backward_graph and tl.show_backward_graph for Graphviz backward DAG rendering.\n- Renders model_log.grad_fns with a distinct backward palette and gradient-flow edges.\n- Includes forward-layer cross-references in grad_fn labels where available.\n- Marks intervening grad_fns with a [i] label prefix and custom autograd grad_fns with a [custom] suffix.\n- Keeps forward graph default behavior unchanged.\n\nOut of scope:\n- NO disk streaming; deferred to PR 3.\n- NO tutorial; deferred to PR 3.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0aaa2f3a2248`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.