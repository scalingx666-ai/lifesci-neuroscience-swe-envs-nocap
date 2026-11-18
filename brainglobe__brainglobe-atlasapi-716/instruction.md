# Issue

**Title:** Add SWC female template mode support to WHS SD rat atlas script

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

To support generating the WHS SD rat atlas using the SWC female rat template as the reference image, in addition to the existing Waxholm/NITRC workflow.

**What does this PR do?**

- Adds dual-mode support via `swc_female_template` flag:
  - SWC mode: Uses SWC female rat template, downloads individual files from GIN with hash verification
  - Waxholm/NITRC mode: Original workflow using zip archives (unchanged)
- Refactors download functions to support both modes
- Simplifies mesh creation by using `construct_meshes_from_annotation()`
- Adds reference stack normalization for SWC template mode
- Updates orientation to "pir" for SWC mode (not sure why it is pir, source image has to be checked)
- Bumps version to 3

## How has this PR been tested?
It was run interactively on an HPC node

## Is this a breaking change?
no

## Does this PR require an update to the documentation?
Likely

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96f7a747e124`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.