# Issue

**Title:** Adds poses_to_bboxes() to movement.transforms to generate 2D bounding

## Description

## Description

**What is this PR**

- [ ] Bug fix  
- [x] Addition of a new feature  
- [ ] Other  

**Why is this PR needed?**

Currently, the project provides pose datasets but does not include a built-in
method to derive bounding box annotations directly from pose keypoints. Many
downstream tasks—such as tracking, filtering, visualization, and integration
with bbox-based workflows—require bounding box representations.

This PR addresses this gap by enabling an automatic and consistent conversion
from pose datasets to bounding box datasets.

**What does this PR do?**

This PR introduces a new transform, `poses_to_bboxes()`, which converts 2D pose
datasets into bounding box datasets.

Specifically, it:
- Computes per-frame, per-individual bounding boxes from pose keypoints
- Represents bounding boxes using centroid (`position`) and size (`shape`)
- Ignores keypoints with NaN coordinates; outputs NaN bboxes when no valid
  keypoints are available
- Aggregates bounding box confidence as the mean of valid keypoint confidences
- Supports optional pixel padding around bounding boxes
- Validates inputs and raises clear errors for unsupported cases (e.g. 3D poses,
  negative padding)
- Preserves dataset coordinates, attributes, and operation logs

## References

- 

## How has this PR been tested?

- Added comprehensive unit tests covering:
  - Basic pose-to-bbox conversion
  - NaN handling (partial and full)
  - Confidence aggregation
  - Padding behavior
  - Error cases (invalid input type, missing variables, 3D poses, negative padding)
  - Metadata and coordinate preservation
- All tests pass locally using `pytest`

## Is this a breaking change?

No. This PR adds a new transform without modifying existing APIs or behavior.

## Does this PR require an update to the documentation?

No additional documentation updates are required beyond the function docstring.
The new functionality is fully documented inline.

## Checklist:

- [x] The code has been tested locally  
- [x] Tests have been added to cover all new functionality  
- [x] The documentation has been updated to reflect any changes  
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b9d29403b42`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.