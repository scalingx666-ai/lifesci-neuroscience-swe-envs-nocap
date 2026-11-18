# Issue

**Title:** Refresh the Zarr links modal

## Description

### Summary
Refreshes the "Manage Zarr Links" modal:
- Each link is an accordion panel listing every layer URL in full, with a labelled **Copy** button. The input is read-only (not disabled), so selecting it copies a working link.
- Adds the whole-dataset link as "All layers", tagged **WEBKNOSSOS only**.
- New empty state, "Create Another Zarr Link" button, "Close" instead of "OK", and a cleaner expiration date popover (full-width picker + delete icon).
- The public Zarr link in "Share this Dataset" uses the same per-layer rows.
- When logged out, "Share", "Zarr Links" and "Restore Older Version" are disabled with a tooltip instead of opening dialogs that fail with "Authentication required" toasts.

<img width="2000" height="1100" alt="image" src="https://github.com/user-attachments/assets/6c6109dd-33d9-4549-809a-a2a65fe0d40f" />


### Steps to test:
- Open an annotation, Menu > Zarr Links. Check the empty state, create a few links, and verify only one panel is open at a time and the newest one opens after creating.
- Click into a URL input and copy it with Cmd/Ctrl+C, and also with the Copy button. Both give the full URL.
- Change and remove an expiration date; delete a link. The panel must not toggle while doing so.
- Open a public dataset in view mode, Share: the Zarr link section shows one row per layer plus "All layers".
- Open a public annotation while logged out: the three menu entries are disabled and show a tooltip.

### Issues:
- 
-  (addresses the remaining copy-button and logged-out items)
- (Zarr links in view mode still need backend work, )

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6bb268f2ab62`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.