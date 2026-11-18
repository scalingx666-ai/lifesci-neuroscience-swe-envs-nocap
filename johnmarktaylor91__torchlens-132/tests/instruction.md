# Issue

**Title:** fix(vis): avoid graphviz.Digraph memory bomb when ELK fails on large graphs

## Description

## Summary
- **Root cause**: ELK's stress algorithm allocates TWO O(n²) distance matrices (n² × 16 bytes). At 100k nodes = 160 GB, at 1M nodes = 16 TB. The old >150k stress-switch threshold could never work.
- **Fix**: For graphs >100k nodes, bypass ELK entirely and compute a topological rank layout in Python (Kahn's algorithm, O(n+m)). Module bounding boxes computed from node positions. Result feeds into the same `neato -n` rendering path, preserving cluster boxes.
- **Fallback**: If ELK fails for smaller graphs, the Python topological layout is used as fallback (instead of the old sfdp path that built a `graphviz.Digraph` which exploded on nested subgraph body-list copies).
- **rendering.py**: ELK path no longer falls through to `graphviz.Digraph` construction — all large-graph rendering stays on the fast DOT-text path.

## Layout engine tiers (after this PR)
| Node count | Engine | Notes |
|---|---|---|
| <3,500 | Graphviz `dot` | Standard layered layout |
| 3,500–100k | ELK (Node.js) | Layered algorithm, hierarchical |
| >100k | Python topological | Kahn's algorithm, O(n+m), module bboxes from positions |
| Any (ELK failure) | Python topological | Automatic fallback |

## Test plan
- [x] Smoke tests pass (18/18)
- [x] Visualization tests pass (32/32)
- [x] Unit test: `_compute_topological_layout` produces correct positions + bboxes
- [x] Integration test: Full render pipeline with Python layout produces valid SVG
- [x] Integration test: ELK path still works for small graphs
- [ ] Manual test with `python scripts/render_large_graph.py 1000000` — should complete without OOM

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `364ea3911a04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.