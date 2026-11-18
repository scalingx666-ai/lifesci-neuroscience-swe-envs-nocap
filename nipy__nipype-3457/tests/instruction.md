# Issue

**Title:** REL: 1.8.0

## Description

Preparation for the 1.8.0 release, targeting Thursday.

The main impetus is the PETSurfer interfaces (#3437) which it will help people to have released. Also, we're dropping support for Python 3.6, which is overdue.

Quick issues/PRs:

* [x] #3439 
* [x] #3463
* [x] ... (Ping me if you want something added to this list)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e7daead51b35`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.