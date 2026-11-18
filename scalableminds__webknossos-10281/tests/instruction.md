# Issue

**Title:** Fix root saga crash when a 3D flood fill exceeds 5M voxels

## Description

### Summary
A 3D flood fill that reached 5M voxels threw an error that nothing caught, which crashed the root saga. The limit is easy to reach: the default 3D fill box holds 8M voxels (40M when restricted to a bounding box).

Now the fill stops at the limit, keeps what it has filled so far, and shows the usual "terminated because the labeled volume got too large" notification. In 3D, it also adds a bounding box around the filled area. This notification now also appears when the fill is restricted to a bounding box, because the fill may have stopped before reaching that box. In that case, no new bounding box is added, since it would be picked as the restriction for the next fill.

I kept the 5M limit instead of removing it. Without it, a fill of a uniform 200³ region took about 2.3 GB of memory in a quick benchmark, and a 342³ region (40M voxels) ran out of memory.

### Steps to test:
- Open a volume annotation, choose the fill tool in 3D mode, and fill a region connected to more than 5M voxels within the 200³ box (e.g. background). The fill stops, a warning toast appears, a bounding box is added, and the viewer keeps working.
- Same with "restrict to bounding box" enabled and a large enough bounding box: the warning appears as well, but no bounding box is added.
- Normal small fills still finish with "Floodfill done."

### Issues:
-

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `130b14d88bb9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.