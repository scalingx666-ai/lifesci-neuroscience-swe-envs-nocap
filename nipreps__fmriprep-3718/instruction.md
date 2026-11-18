# Issue

**Title:** enh: build BOLD coregistration template from selected runs

## Description

This PR lets users choose the runs through a `boldref_template` column in the BIDS `*_scans.tsv` file of each session (or else from the first `--derivatives` dataset with a valid scans file):

```
filename	boldref_template
func/sub-01_ses-01_task-rest_run-1_bold.nii.gz	target
func/sub-01_ses-01_task-rest_run-2_bold.nii.gz	include
func/sub-01_ses-01_task-rest_run-3_bold.nii.gz	n/a
```

- `target`: defines the template space and is averaged into the template. At most one per template.
- `include`: averaged into the template. Without a `target`, a single `include` defines the space, and two or more build an unbiased template.
- `n/a` (also empty or unlisted): registered to the template, but not part of it.

Template metadata records the runs used in `TemplateSpace` and `TemplateData`.

A future PR will include a utility to facilitate labeling these scans.tsv.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `49511cea41a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.