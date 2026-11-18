# Issue

**Title:** Allow deleting a node while reconnecting its two neighbors

## Description

### Summary
Adds a node context-menu entry "Delete this Node & Reconnect Neighbors". It deletes a node that has exactly two neighbors and connects those neighbors with a new edge, so the tree is not split. It is implemented as a single reducer action (`DELETE_NODE_AND_RECONNECT_NEIGHBORS`), so it is one undo step and saves as `deleteNode`/`deleteEdge`/`createEdge` update actions. Edge direction is kept (A → N → B becomes A → B). The entry is disabled with a tooltip for nodes that don't have exactly two neighbors, and it is hidden for agglomerate trees.

### Steps to test:
- Open a skeleton annotation and create a chain of nodes (A → N → B)
- Right-click N and choose "Delete this Node & Reconnect Neighbors": N is gone, A and B are connected, the tree is not split, and A becomes active
- Undo (Ctrl+Z) restores N and both edges in one step; reload after saving and check that the result persisted
- Right-click a leaf node or a branching node (3+ neighbors): the entry is disabled with a tooltip

### Issues:
-

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Updated [documentation](../blob/master/docs) if applicable
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d090dd01b64b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.