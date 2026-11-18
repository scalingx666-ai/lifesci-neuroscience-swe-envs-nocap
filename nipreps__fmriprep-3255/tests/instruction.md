# Issue

**Title:** ENH: Use BIDS URIs to track Sources in sidecars

## Description

. This is just a first pass- it only modifies the RawSources for now. I can add the immediate Sources in another PR (this'll require a lot more effort).

## Changes proposed in this pull request

- Add `DatasetLinks` field to the `dataset_description.json`
    - The input dataset is called `raw`
    - Any other datasets supplied through `--derivatives` are automatically named `deriv-<index>`. We might want to support named derivatives at some point.
- Replace BIDS-relative paths in `RawSources` fields with BIDS-URIs.
- Change `RawSources` to `Sources` in the sidecar files, since `RawSources` is deprecated.

## Documentation that should be reviewed

I'll probably need to update the documentation, but haven't yet.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c46c89307518`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.