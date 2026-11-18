# Issue

**Title:** Add "Insert Node on Edge" action to skeleton node context menu

## Description

### Summary

- Adds an "Insert Node on Edge to this Node" entry to the skeleton node context menu. It is enabled when the right-clicked node is directly connected to the active node.
- The new node is placed at the midpoint of the edge and becomes the active node. The edge direction is kept (A -> B becomes A -> N -> B), and the tree is not split, so its ID and color stay the same.
- Implemented as a single `INSERT_NODE_ON_EDGE` reducer action, so it is one undo step. It saves as one `createNode`, one `deleteEdge`, and two `createEdge` updates.
- The entry is hidden for agglomerate trees. It is blocked wherever node creation is blocked (read-only annotations, concurrent collaboration mode, skeleton rendered with transforms).
- Adds reducer and saga tests and a row in the context menu docs.

### Steps to test:
- Create a tree with at least three nodes in a chain (1 -> 2 -> 3).
- Make node 1 active, then right-click node 3. Confirm the "Insert Node on Edge to this Node" entry is disabled, since the nodes are not directly connected.
- Make node 1 active, then right-click node 2. Click the entry. Confirm a new node appears at the midpoint between nodes 1 and 2, becomes active, and the tree is still one tree.
- Undo once and confirm the inserted node is removed and the original edge is restored.
- Right-click the same edge from the other side (active node 2, clicked node 1) and confirm the same result.
- Check that the entry is not shown for an agglomerate tree (proofreading view).
- Run `yarn typecheck`, `yarn check-frontend`, and `yarn test` (the skeleton reducer and saga specs pass locally, 111 tests).

### Issues:
-

------
(Please delete unneeded items, merge only when none are left open)
- [ ] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Added migration guide entry if applicable (edit the same file as for the changelog)
- [x] Updated [documentation](../blob/master/docs) if applicable
- [ ] Adapted [wk-libs python client](https://github.com/scalableminds/webknossos-libs/tree/master/webknossos/webknossos/client) if relevant API parts change
- [x] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [ ] Needs datastore update after deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `644218fd6eec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.