# Issue

**Title:** feat(visualization): focus visualization on a single module

## Description

## Summary

Phase 3 of the visualization sprint. Adds the ability to render only a single module's subgraph in the same visual format as the full model.

### New API

- \`\`show_model_graph(..., module=ModuleLog | str | None)\`\`  -- focus on a module by ModuleLog instance or address string.
- \`\`ModelLog.render_graph(..., module=...)\`\`  -- same arg on the rolled/unrolled render path.
- \`\`ModuleLog.show_graph(**kwargs)\`\`  -- thin wrapper that calls render_graph with module=self.

Synthetic input/output boundary nodes show external upstream/downstream layers, styled like the model-level input/output. \`\`collapse_fn\`\`, \`\`skip_fn\`\`, and the mode presets compose normally inside the focused subgraph.

### Test plan

- [x] tests/test_module_focus.py (244 lines) covers ModuleLog and address-string focus, invalid address raises, branching boundaries, and composition with collapse_fn / skip_fn / ModuleLog.show_graph
- [x] mypy / ruff clean
- [x] smoke tests pass
- [x] prior-phase viz tests still pass

### Notes

Pre-existing timm real-world validation failures (test_timm_gluon_resnext101_32x4d, test_timm_ecaresnet101d) reproduce on the base branch and are unrelated to this PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ddfdd34fad8e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.