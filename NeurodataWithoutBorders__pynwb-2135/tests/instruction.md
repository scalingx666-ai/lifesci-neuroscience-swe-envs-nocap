# Issue

**Title:** Do not set data_type_inc=NWBContainer for NWBContainer

## Description

## Motivation

In NWB schema < 2.2.0, the neurodata type `NWBContainer` had no `neurodata_type_inc`. Starting in NWB schema 2.2.0, `neurodata_type_inc` was set to `Container` (from hdmf-common).

Currently, in `NWBGroupSpec`, if `data_type_inc` is not set, then it is set to `NWBContainer`. So when reading old files with cached NWB schema < 2.2.0, `NWBContainer` which doesn't have `data_type_inc` set will have it set to `NWBContaienr`. Then `data_type_def == data_type_inc` which should not be allowed and messes up inc spec resolution. After  is merged, this situation will raise an error.

This PR prevents setting `data_type_inc = "NWBContainer"` when `data_type_def = "NWBContainer"`. Same for `NWBData`.
 
## How to test the behavior?
```
Load the old file https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/tests/back_compat/1.0.3_nwbfile.nwb
with the new HDMF spec resolution
```

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [ ] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fa6a2140383b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.