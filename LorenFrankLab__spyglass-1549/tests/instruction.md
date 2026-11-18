# Issue

**Title:** Multi-epoch VideoFile insertion

## Description

# Description

This PR updates the NWB video ingestion logic to support session-spanning video files, where a single video covers an entire recording session across multiple discrete epochs. Previously, the ingestion code assumed a one-to-one mapping between epochs and video files. This change generalizes that logic to handle both cases.

- : Support session-spanning video files in NWB ingestion
    - `src/spyglass/common/common_behav.py`: Extended ingestion logic to check whether each epoch is contained within a video's timestamps, in addition to the existing assumption that a video is contained within a single epoch. Multiple epochs can now correctly point to the same `video_file` object ID and image series in the NWB file.

# Checklist:

- [X] N/A. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/A. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/A. If this PR makes changes to position, I ran the relevant tests locally.
- [X] N/A. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d57e8dd502a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.