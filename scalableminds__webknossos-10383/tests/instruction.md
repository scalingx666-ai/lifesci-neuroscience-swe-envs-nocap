# Issue

**Title:** Don't crash if the bucket at a looked-up position can't be loaded

## Description

### Summary
- `getSegmentIdsAtPositionAsync` awaits the loading of the bucket at the position. If the bucket can't be loaded (e.g., the datastore is briefly unreachable), the error crashed the root saga.
- It now logs the error and returns null for both ids. All callers already handle a null mapped id:
  - Adapting the active segment to the proofreading marker: skipped (this was the reported crash).
  - Proofreading click: warning toast.
  - Loading an agglomerate tree: error handling of the agglomerate tree loading.
  - Synapses and loading a precomputed mesh (context menu): toast instead of an unhandled rejection.

### Steps to test:
- Open an annotation with an agglomerate mapping and switch to the proofreading tool.
- Block the bucket requests (`/data/datasets/.../data`) in the dev tools.
- Click a segment in an area that isn't loaded yet → a warning toast appears and the viewer keeps working.
- Set the marker, block the bucket requests, then move so that the mapping is updated → no crash.

### Issues:
-

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac5cd0b09cf8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.