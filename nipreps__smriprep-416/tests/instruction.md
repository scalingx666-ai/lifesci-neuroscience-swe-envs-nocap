# Issue

**Title:** FIX: Re-add cohort identifier to template name

## Description

We have been stripping out the cohort identifier in `split_desc`, and as a result losing the information when saving out transforms. This re-enables the output transforms to include the cohort information, i.e. `...from-MNIPediatricAsym+3_to-T1w_mode-image_xfm.h5`.

However, this change exposes another problem: `collect_derivatives` cannot collect these transformations, as the current `BIDSLayout` configurations do not account for the `+` character during parsing. Since BIDS derivatives conventions are still a bit murky, I figured we want to just create a modified `fmriprep-derivatives` config to catch this convention when parsing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `51da19b6ea2c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.