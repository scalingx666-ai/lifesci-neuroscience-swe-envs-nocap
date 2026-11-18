# Issue

**Title:** Add source_software auto-detection for dataset loading

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Loading data with `load_dataset()` currently requires users to pass `source_software` explicitly, even when the file format is distinctive enough to infer it automatically. This adds boilerplate to common workflows and makes the API a bit less convenient for users who just want to load a supported file.

At the same time, some DLC-style CSV files can match both DeepLabCut and LightningPose, so inference should be helpful without hiding ambiguity in metadata.

**What does this PR do?**

- adds `infer_source_software(file)` to infer the source software from the input file
- adds support for `source_software="auto"` in `load_dataset()`
- makes `load_dataset()` default to automatic source inference
- uses registered validators to infer supported formats
- handles the DeepLabCut vs LightningPose CSV overlap with a small heuristic
- for ambiguous DLC-style CSV files, loads with the shared DeepLabCut-compatible loader and sets `ds.attrs["source_software"] = "DeepLabCut/LightningPose"`
- exports `infer_source_software` from `movement.io`
- adds unit tests covering supported formats and the ambiguous DLC-style CSV path
- updates the user guide to document automatic inference and ambiguous CSV behavior

## References

## How has this PR been tested?

This PR was tested locally with:

```bash
pytest tests/test_unit/test_io/test_load.py
```

This covers:
- direct testing of `infer_source_software()`
- loading via `load_dataset(..., source_software="auto")`
- supported formats including DeepLabCut, LightningPose, SLEAP, Anipose, VIA-tracks, and NWB
- the ambiguous DLC-style CSV case, which now loads and tags metadata as `DeepLabCut/LightningPose`

I also ran the repository pre-commit checks as part of committing the changes.

**Is this a breaking change?**

- [ ] Yes
- [x] No

Existing explicit uses of `load_dataset(..., source_software=...)` are unchanged. This PR adds automatic inference as a convenience feature and preserves ambiguity explicitly in dataset metadata for DLC/LP-overlapping CSVs.

**Does this PR require an update to the documentation?**

- [x] Yes
- [ ] No

The user guide has been updated to:
- describe automatic source software inference
- show usage with `source_software="auto"`
- explain how ambiguous DLC-style CSVs are handled and tagged in metadata

**Checklist:**

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with pre-commit

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `43092455fa6a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.