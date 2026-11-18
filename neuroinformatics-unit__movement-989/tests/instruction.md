# Issue

**Title:** Allow individual-wise confidence arrays

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Currently, `confidence_array` validation only supports keypoint-level confidence arrays with shape `(time, keypoint, individual)`. However, some pose estimation formats such as COCO may provide confidence values at the individual level instead, with shape `(time, individual)`.

This PR is needed to support these valid confidence formats without breaking existing behavior.

**What does this PR do?**

This PR extends `confidence_array` validation to support both keypoint-level confidence arrays with shape `(time, keypoint, individual)` and `individual-level confidence arrays` with shape `(time, individual)`. Existing validation behavior for invalid shapes is preserved, and `_validate_array_shape` remains unchanged. In addition, tests were added to cover valid `keypoint-level confidence arrays`, `valid individual-level confidence arrays`, and `invalid confidence array shapes`.

## References

Related to COCO-format compatibility discussions.

## How has this PR been tested?

The changes were tested locally by instantiating `ValidPosesInputs` with valid keypoint-level confidence arrays, valid individual-level confidence arrays, and invalid confidence array shapes to verify the expected validation behavior. Validator tests were also run locally using pytest, and existing validation behavior was confirmed to remain unchanged.

## Is this a breaking change?

No.

Existing `keypoint-level confidence arrays` continue to behave as before. This PR only adds support for an additional valid confidence array shape.

## Does this PR require an update to the documentation?

Documentation updates are required since this PR extends the accepted `confidence_array` validation behavior by adding support for individual-level confidence arrays with shape `(time, individual)`. So documentation has to reflect the new available shape of `confidence_array`.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cffc65695ce9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.