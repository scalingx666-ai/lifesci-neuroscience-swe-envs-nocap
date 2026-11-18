# Issue

**Title:** Thumbnails: skip layers with no matching mags

## Description

### Summary
 - Saw some erroring thumbnail requests because some of the layers had no coarse mags that matched the zoom level. That led to too many voxels being requested from the finer mag, which was rejected by the datastore limits.
 - Now we just skip those layers.

### Issues:
- fixes https://scm.slack.com/archives/C5AKLAV0B/p1793096560886499

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [x] Needs datastore update after deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `63d714310530`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.