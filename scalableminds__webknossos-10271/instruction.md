# Issue

**Title:** Load agglomerate trees in an operation context

## Description

### Summary
Loading an agglomerate tree (`loadAgglomerateTreeWithAtPosition`) did not run in an operation context. So the viewports weren't blocked and proofreading actions could run while the tree was being fetched. The tree is fetched for the annotation version at request time, and the agglomerate tree syncing of a proofreading action only updates trees that are already in the skeleton. Result: e.g., merging agglomerate 4 into 1 while the tree of 1 is loading added an outdated tree "agglomerate 1" (without the segments of 4), which was then saved for all users.

Now:
- Tree loading runs in the new operation `LOAD_AGGLOMERATE_TREE` (via `takeEveryInOperationContext`, which now also accepts channels). Proofreading actions are ignored while a tree is loading (like for every other operation).
- If another operation runs when the user requests a tree, the tree loading waits (`behaviorWhenDisallowed: "wait"`) instead of being ignored. This is safe, because nothing is held while waiting. `takeEveryInOperationContext` now respects `behaviorWhenDisallowed` (default stays "ignore").
- The operation context is passed to the sync (`dispatchEnsureHasNewestVersionAsync`, so `REBASE` runs as a child without the 1 s retry from #10244) and to `Model.ensureSavedState` (required: otherwise, saving would need its own operation, which can't start while the tree loading runs → self-deadlock).
- Test helper `loadAgglomerateTrees` now waits until the tree loading operation is finished (instead of `SNAPSHOT_ANNOTATION_STATE_FOR_NEXT_REBASE` / `ADD_TREES_AND_GROUPS`, which fire before the operation ends); its now unused `isInLiveCollabMode` parameter was removed.

### Steps to test:
- Manually: in a proofreading annotation (e.g., Concurrent mode) load an agglomerate tree via the context menu and try a proofreading action while the "Loading tree…" toast is shown. The action should be ignored; afterwards, merges should update the tree as before.

### Issues:
- follow-up of debugging a collaborative proofreading report

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3294f120a269`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.