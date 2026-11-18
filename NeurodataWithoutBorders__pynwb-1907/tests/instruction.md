# Issue

**Title:** Add "bounds" to SpatialSeries fields

## Description

## Motivation

I noticed that pynwb tests were passing with NWB schema 2.7.0 even though "bounds" was not added to SpatialSeries until after NWB schema 2.7.0, so really the IO tests should fail. 

Until then, on the dev branch, "bounds" in `SpatialSeries.__init__` will not be written to disk because it is missing from `__nwbfields__`.

Using the convenience test classes can hide this error. I think we should be more explicit when writing roundtrip tests to ensure that all expected fields are read correctly from the written file.

This PR merges into a new `nwb_schema_2.8.0` branch.

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `flake8` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc98e84e7315`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.