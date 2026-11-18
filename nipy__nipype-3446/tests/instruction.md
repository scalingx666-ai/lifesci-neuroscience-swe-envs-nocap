# Issue

**Title:** REL: 1.7.1

## Description

## Summary

Release prep for 1.7.1. Aiming for Monday, but if PRs look to be wrapping up, I'm happy to hold off for a couple days to get them in.

Quick issues/PRs:

* [x] #3445 (cc @GalBenZvi @ZviBaratz)
* [ ] #3407 (cc @bbfrederick)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ac21893069a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.