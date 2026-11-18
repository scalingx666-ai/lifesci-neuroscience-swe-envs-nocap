# Issue

**Title:** feat(vis): ELK layout engine for large graph visualization

## Description

## Summary
- Add ELK (Eclipse Layout Kernel) as an alternative layout engine for graphs with 3500+ nodes where Graphviz `dot` hangs or crashes
- Add `RandomGraphModel` test fixture for generating controlled-size graphs up to 1M nodes
- Add `vis_node_placement` parameter (`"auto"`, `"dot"`, `"elk"`, `"sfdp"`) to `log_forward_pass()` and `show_model_graph()`
- ELK path bypasses `graphviz.Digraph` construction entirely — generates DOT directly with pre-computed positions and module cluster boxes
- Auto-scales Node.js heap, stack, and timeouts with graph size
- Graceful fallback chain: elk → sfdp → warning

## Scaling results

| Nodes | Total time | Output |
|-------|-----------|--------|
| 500 | 3s | 124KB pdf |
| 5k | 25s | 741KB pdf |
| 25k | 3 min | 3.6MB pdf |
| 50k | 6 min | 81MB svg |
| 100k | 16 min | 165MB svg |
| 250k | TBD | TBD |

## Test plan
- [x] 18/18 smoke tests pass
- [x] Engine selection tests pass (auto/dot/elk/sfdp routing)
- [x] ELK utility tests pass (graph building, position injection)
- [x] dot-vs-ELK aesthetic comparison tests at 15/100/500/1k/3k nodes
- [x] Verified rendering at 5k, 25k, 50k, 100k nodes
- [ ] 250k render in progress
- [ ] 1M trophy run planned

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c124ac77ec16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.