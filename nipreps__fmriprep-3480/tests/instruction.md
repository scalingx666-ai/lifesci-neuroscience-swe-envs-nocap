# Issue

**Title:** MNT: no need to re-run `ruff check` after `ruff format`

## Description

<!--
Text in these brackets are comments, and won't be visible when you submit your pull request.
If this is your first contribution, please take the time to read these, in particular the comment
beginning "Welcome, new contributors!".
-->

## Changes proposed in this pull request

Running `ruff check` then `ruff format` should always do the right thing.

No need to rerun `ruff check` specifically for `ISC001`.

## Documentation that should be reviewed
<!--
Please summarize here the main changes to the documentation that the reviewers should be aware of.
-->



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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4dbeb3e5fce`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.