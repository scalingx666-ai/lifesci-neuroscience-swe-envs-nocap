# Issue

**Title:** Fix reverted buckets not getting fallback data in updateBucketPartial

## Description

### Summary
(AI-written)

  Fixes a bug on volume layers that have a fallback segmentation. If a version restore marked a bucket as reverted and someone then painted in it, all fallback segments in that bucket were lost.

  Cause: when `loadBuckets` loads several buckets at once, it only fetched fallback data for buckets missing from FossilDB. A reverted bucket is not missing: it is stored as the marker `[0]`. So it skipped the
  fallback lookup and was only turned into `Empty` afterwards. `VolumeBucketBuffer` then turned that `Empty` into a zero bucket and folded `updateBucketPartial` runs onto zeros instead of onto the fallback
  data. The single-bucket `loadBucket` and the frontend already treat a marker as "use the fallback data".

  - `loadBuckets` now turns reverted markers into `Empty` before the fallback lookup, so they get fallback data the same way missing buckets do.
  - The two steps (turning markers into `Empty` and filling `Empty` buckets with fallback data) are now pure functions in the `VolumeTracingBucketHelper` companion object, with unit tests in
  `VolumeBucketFallbackTestSuite`.
  - The segment-index diff in this path also starts from the fallback data now instead of zeros.

  ### Steps to test:
  - Create a volume annotation on a dataset with a segmentation layer and use that layer as the fallback.
  - Paint in a region where there are fallback segments, and save.
  - Open the version history and restore a version from before that paint.
  - Paint a single small stroke in the same bucket (live collaboration mode, so it's saved as `updateBucketPartial`), and reload.
  - The fallback segments around the stroke should still be visible. Before this fix, the rest of the bucket was empty.
  - `yarn test-backend`

  ------
  - [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
  - [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5f2a9bc39cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.