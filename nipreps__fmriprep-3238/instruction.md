# Issue

**Title:** Flip order of transforms in `init_ds_volumes_wf`

## Description

.

## Changes proposed in this pull request

- Switch order of transforms in `boldref2target` node of `init_ds_volumes_wf` from boldref2anat_xfm --> anat2std_xfm to anat2std_xfm --> boldref2anat_xfm, as antsApplyTransforms expects transforms to be provided in reverse order.


## Documentation that should be reviewed
<!--
Please summarize here the main changes to the documentation that the reviewers should be aware of.
-->
none



<!--
Welcome, new contributors!

We ask you to read through the Contributing Guide:
https://github.com/nipreps/fmriprep/blob/master/CONTRIBUTING.md

These are guidelines intended to make communication easier by describing a consistent process, but
don't worry if you don't get it everything exactly "right" on the first try.

To boil it down, here are some highlights:

1) Consider starting a conversation in the issues list before submitting a pull request. The discussion might save you a
   lot of time coding.
2) Please use descriptive prefixes in your pull request title, such as "ENH:" for an enhancement or "FIX:" for a bug fix.
   (See the Contributing guide for the full set.) And consider adding a "WIP" tag for works-in-progress.
3) Any code you submit will be licensed under the same terms (Apache License 2.0) as the rest of fMRIPrep.
4) We invite every contributor to add themselves to the `.zenodo.json` file
   (https://github.com/nipreps/fmriprep/blob/master/.zenodo.json), which will result in your being listed as an author
   at the next release. Please add yourself as the next-to-last entry, just above Russ.

A pull request is a conversation. We may ask you to make some changes before accepting your PR,
and likewise, you should feel free to ask us any questions you have.

-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8b3a957bdabe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.