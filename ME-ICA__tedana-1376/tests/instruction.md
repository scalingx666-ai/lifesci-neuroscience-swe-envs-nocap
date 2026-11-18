# Issue

**Title:** Address test and RTD build warnings

## Description

Closes none, but addresses issues brought up in the most recent devs call.

Changes proposed in this pull request:

- Fix API links.
- Fix link to metric function for "normalized variance explained".
- Remove "dependence_metrics" from hidden TOC.
- Use new `standardize` parameter `carpet_plot`. Also close the figures once we're done with them.
- Remove deprecated `numpy.matlib.repmat` call.
- Work around divide-by-zero warnings by using `numpy.divide` with a `where` argument.
- Toggle import of check_niimg based on nilearn version.
- Address pandas.replace warning by also calling infer_objects.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd3cc54a0418`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.