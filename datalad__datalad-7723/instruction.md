# Issue

**Title:** BF: import from distutils.errors directly if no longer in setuptools

## Description

May be in the future we should just switch to a more generic exception type there if that code is still relevant at all

 

edit 1: oh no!  Since we never swallowed the pill to distill a single of those https://github.com/datalad/datalad-buildsupport deprecating never used https://github.com/datalad/datalad_build_support, and duplicated the code everywhere, we have the same issue in extensions! heh  ... separate issue/PRs to push

edit 2.1: oh -- it was actually here (and those few other extensions and our extensions templa) where in our attempt to "get rid of distutils" we moved from that import to be done from `distutils.errors` in 40ce29923ec1d22174b0624bd1166cd670b61a0e. 

final edit: **the verdict is to import and use `OptionError` (not `DistutilsOptionError`) from `setuptools.errors` which came to existence in setuptools 59.0.0. GitHub python envs could have outdated setuptools 58.1.0 thus requiring explicit upgrade (uff)**.  I will introduce similar fixes elsewhere where needed.  

Related PRs
- 
- 
-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f581a6c57bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.