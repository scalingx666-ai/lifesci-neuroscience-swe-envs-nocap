# Issue

**Title:** Fix listing of unfinished dataset uploads

## Description

### Summary
"Continue upload" on the dataset upload page never listed anything since #9402: `GET /data/datasets/upload/dataset/unfinishedUploads` always returned `[]`.

Root cause: `DatasetUploadMetadataStore` wrote the upload id per data source id JSON-serialized (`insertSerialized`, i.e. with quotes) but read it back raw (`find`). The quoted id then matched no upload metadata, so every unfinished upload was silently filtered out. The fix stores it as a plain string (`insert`), matching how the layer name is stored. Added a unit test for the insert/find round trip (using an in-memory store, no Redis needed).

### Steps to test:
- Start a large dataset upload, reload the page mid-upload, reopen the upload page → the "Unfinished Dataset Uploads" alert lists it
- "Continue upload" with the same files resumes the upload

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [x] Needs datastore update after deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `05e6a253bd4a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.