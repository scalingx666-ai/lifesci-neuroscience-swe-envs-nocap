# Issue

**Title:** Add COCO keypoint results loader

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

This PR adds support for loading COCO keypoint results into a `movement` poses dataset.

**What does this PR do?**

- Adds support for loading COCO keypoint results JSON files.
- Adds validation for COCO results and annotations JSON files.
- Supports loading keypoint names from a COCO annotations file.
- Supports `category_as_track` to use COCO categories as individuals.
- Handles COCO `image_id`s as frame numbers.
- Uses COCO detection scores as confidence values.
- Adds tests covering the new COCO loading functionality and validation errors.

## References

#1000 

## How has this PR been tested?

Added unit tests covering:
- Loading COCO keypoint results.
- Loading results with and without an annotations file.
- `category_as_track=True`.
- Missing/unknown categories.
- Duplicate category detections within a frame.
- Different keypoint skeletons between categories.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

Yes, documentation will need to be updated to cover the new COCO keypoint results loader. The documentation update is not included in this PR and will be addressed separately.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a26eeb8c919d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.