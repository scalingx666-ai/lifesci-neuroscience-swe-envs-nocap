# Issue

**Title:** Speed up abstract tree tab and render it sharply on HiDPI displays

## Description

### Summary
- Speeds up the abstract tree tab: `drawTree` on a synthetic 200k-node tree went from 1.3 s to 138 ms (~9×).
  - Commented nodes are looked up via a `Set` instead of scanning all comments per node.
  - Outgoing edges are copied into a plain `Map` once instead of chunk-scanning the `DiffableMap` per node.
  - The tab only redraws when the active tree or active node changes, not on every skeleton change.
- Fixes comment highlighting: the renderer checked `comment.node` instead of `comment.nodeId`, so comments were never detected (no red nodes, chains didn't break at comments).
- Fixes the blurry canvas on HiDPI displays by scaling the backing store by `devicePixelRatio`.

### Steps to test:
- Open a large skeleton annotation, enable the AbsTree tab and click "Show Abstract Tree".
- The tree should render quickly and sharply. Nodes with comments are red. Clicking a node still activates it.
- Edit another tree (rename, recolor, add nodes): the abstract tree shouldn't redraw.

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d39abfe8fb5f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.