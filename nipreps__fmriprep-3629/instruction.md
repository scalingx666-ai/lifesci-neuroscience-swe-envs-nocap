# Issue

**Title:** fix: Filter out part and echo entities before collecting functional derivatives

## Description

.

These changes appear to be working in a local fMRIPrep run, though I think that the lack of `part` and `echo` entities in the transform files is the result of those entities not being present in the allowed filename patterns (see [nipreps.json](https://github.com/nipreps/niworkflows/blob/master/niworkflows/data/nipreps.json)), rather than explicitly being dismissed in the DerivativesDataSinks. That means that, if someone does add those entities to the filename patterns, they might appear in the filenames and break this. At least `part` might show up.

## Changes proposed in this pull request

- Filter out echo and part entities before calling `collect_derivatives`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `101d42d62613`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.