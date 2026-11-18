# Issue

**Title:** Fix data loss in reverting a revert of volume or proofreading annotations

## Description

### Summary
(partially AI-written)

Fixes data loss when reverting a revert in volume and proofreading annotations.

**Background:** A revert to `sourceVersion` writes a new version. For every key (volume bucket, segment-to-agglomerate chunk, agglomerate graph) that changed after `sourceVersion`, it writes the key's value at `sourceVersion` again. If the key had no value at `sourceVersion`, it writes a *reverted marker* (tombstone) instead.

**Bug:** The keys were collected with `ReversionAwareVersionedFossilDbIterator`, which skipped every key whose newest value is a tombstone. So a key deleted by one revert was invisible to the next revert and could never be restored:

| version | action | bucket B |
|---|---|---|
| v1 | – | doesn't exist |
| v2 | user annotates | data X |
| v3 | revert to v1 | tombstone |
| v4 | revert to v2 | **should be X, stayed deleted** |

**Fix:** The revert now iterates all keys, including tombstoned ones. For each key changed after `sourceVersion`:

| value at `sourceVersion` | newest value before revert | action |
|---|---|---|
| present | real data | write the old value (unchanged) |
| present | tombstone | write the old value: **restores the deleted key (the fix)** |
| absent | real data | write a tombstone (unchanged) |
| absent | tombstone | do nothing; already deleted, so no redundant tombstone and no segment index update |

For volume annotations, a bucket that was tombstoned before the revert is passed to the segment index update as “previously empty”.

**Second bug fixed on the way**
 - Revert also updates the segment index. Here, reverted elements were treated as all-zero. But in case of a fallback segmentation, it should actually feed the fallback data bucket into the differ, as that is what will ultimately be rendered. We now load the fallback data too feed it to the differ in that case. This is true for both the data before and data after the revert.

**Cleanup**:
- Removed `ReversionAwareVersionedFossilDbIterator`; the revert loops were its only users.
- Volume: the new `bucketStreamWithVersionIncludingReverted` returns tombstones as `None`. `bucketStream` filters them out, so downloads and other normal readers don't change.
- Removed the unused `bucketStreamWithVersion` from the bucket providers and the helper.
- Editable mapping: the revert loops only need key and version, so the values are no longer parsed.

### Steps to test:
- Volume annotation: at v1, have an empty region. Annotate there (v2). Restore v1 from the version history, then restore v2. The annotation from v2 should be back. Check that the segment list/statistics include it again.
- Proofreading annotation: do the same with a split/merge, restoring the version before it and then the version after it. The split/merge should be back.
- Restore an older version several times in a row; nothing should break, and data that was deleted should stay deleted.

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23c899534c69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.