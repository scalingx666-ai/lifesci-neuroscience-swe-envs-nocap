# Issue

**Title:** Fix several small frontend errors reported to Airbrake

## Description

### Summary
Fixes three small frontend errors found while reviewing Airbrake errors from webknossos.org:

- **Voxelytics DAG view:** `t?.hasAttribute is not a function` when the window loses focus. #9924 disabled React Flow's key handlers but missed `panActivationKeyCode` (defaults to `Space`). That listener still received the synthetic `keyup` that `@rwh/keystrokes` sends to `document` on blur. Panning by dragging still works.
- **Connectome tab:** `Cannot read properties of undefined (reading 'find')` in rc-tree's `onFocus`. The synapse tree passed `selectedKeys={undefined}`, which rc-tree stores as its selection state. It now passes `[]`, so nodes still never stay selected.
- **Voxel pipette tooltip:** "Bucket … could not be loaded after 3 retries" showed up as an unhandled rejection. Layers whose bucket can't be loaded are now left out of the tooltip.
- **`useFetch`:** results from outdated requests are now ignored. Otherwise a slow request (e.g. a bucket load that fails after its retries) could overwrite the tooltip with values from a previous position. This applies to all `useFetch` users.

Not included: the same bucket error can also crash the root saga through `getSegmentIdForPositionAsync`. That needs a decision per calling saga, so it's not part of this PR.

### Steps to test:
- Voxelytics workflow report: hold a key, switch to another window, come back. No error in the console.
- Connectome tab: load a connectome, tab into the synapse tree with the keyboard. No crash; clicking a synapse still jumps to it and doesn't stay selected.
- (Hard to trigger by hand) With the data store unreachable, hovering with the voxel pipette doesn't cause an unhandled rejection.

### Issues:
- Related: #10275, #10276, #10277 (the larger bugs from the same review)
- The ad-hoc mesh fix moved to #10280

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e59569ec6548`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.