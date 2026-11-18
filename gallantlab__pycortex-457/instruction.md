# Issue

**Title:** FIX update nibabel deprecated methods

## Description

Fix failing test with recent nibabel (as in #456 for example).

See [nibabel 2.1 changelog](https://github.com/nipy/nibabel/blob/225892af18d82b9a91ab63a9d072b894588b670e/Changelog#api-changes-and-deprecations-10=):
> Deprecation of `get_header`, `get_affine` method of image objects for removal in version 4.0;

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `908cc8069639`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.