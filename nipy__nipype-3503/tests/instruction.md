# Issue

**Title:** REL: 1.8.4

## Description

Preparation for the 1.8.4 release, to be merged immediately pending tests passing.

Critical fixes in #3501 

Quick issues/PRs:

* ... Please let me know if you want to try to merge something today.

## Release checklist

* [x] Merge pending PRs
* [x] Update changelog
* [x] Update .mailmap
* [x] Update .zenodo.json
* [x] Set release number in `nipype/info.py`
* [x] Update `doc/interfaces.rst` with previous releases
* [x] Check conda-forge feedstock build ()
* [x] Tutorial tests ()

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a91e8877746`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.