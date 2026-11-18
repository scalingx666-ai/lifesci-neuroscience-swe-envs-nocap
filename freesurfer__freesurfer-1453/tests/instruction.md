# Issue

**Title:** DOC: clarify -mask flag of mri_watershed

## Description

Longtime user of FS but first time contributor.

The most consistent barrier to use of FS for me has been the API documentation, which IMO could be more verbose and clear. Here's a small PR that I think improves the docstring for one flag in `mri_watershed`. The current documentation is not clear that this flag takes two input parameters. Hopefully this leaves it in a better state than I found it!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7266dd0dc969`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.