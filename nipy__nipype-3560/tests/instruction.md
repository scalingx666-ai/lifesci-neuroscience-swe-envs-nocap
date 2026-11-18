# Issue

**Title:** REL: 1.8.6

## Description

Preparation for the 1.8.6 release, delayed by broken CI, but needs doing.

@MatthieuJoulot @somso2e @sashashura Please let me know if you would like to be credited in releases, and if so what name, ORCID and affiliation you would like. See https://github.com/nipy/nipype/blob/master/.zenodo.json for examples.

Quick issues/PRs:

* ... Please let me know if you want to try to merge something in. This is really intended to get things fixed for downstream projects, though.

## Release checklist

* [ ] Merge pending PRs
* [x] Update changelog
* [ ] Update .mailmap
* [x] Update .zenodo.json
* [x] Set release number in `nipype/info.py`
* [x] Update `doc/interfaces.rst` with previous releases
* [ ] Check conda-forge feedstock build ()
* [ ] Tutorial tests ()

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46b8c9957195`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.