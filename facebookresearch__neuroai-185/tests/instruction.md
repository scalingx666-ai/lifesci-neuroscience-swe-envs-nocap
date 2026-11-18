# Issue

**Title:** Add Glasser fsaverage ROI projection

## Description

## Summary

`FmriExtractor` can now project Glasser ROI masks from both HCP CIFTI grayordinates and full-resolution fsaverage surface inputs. The projector keeps the dynamic ROI subset as the default, lets users select arbitrary Glasser ROIs by name, and exposes `available_rois()` so ROI choices are discoverable.

This projector masks vertices/grayordinates rather than aggregating each ROI, so output feature counts depend on the input space (`fsaverage7` vs `CIFTI / fsLR`).

## Test plan

- `pytest neuralset-repo/neuralset/extractors/test_neuro.py -k 'glasser or fmri_space_selection' -q`

## What does this PR do?

<!-- Brief description of the change. -->

## Related Issues

<!-- e.g. ,  -->

## Checklist

- [x] Tests added or updated
- [x] Docstrings updated for any changed public APIs
- [x] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d85b7b5f3c8e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.