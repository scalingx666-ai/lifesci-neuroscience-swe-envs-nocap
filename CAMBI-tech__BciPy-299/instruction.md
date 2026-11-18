# Issue

**Title:** Upgrade requirements for rc4

## Description

# Overview

Upgrade requirements to keep us up to date and allow easier m1 installations. 

## Ticket
https://www.pivotaltracker.com/story/show/185927275

## Contributions

- upgrade requirements
- refactored to support pyqt6
- fix BCInterface issues


![interface-upgrades](https://github.com/CAMBI-tech/BciPy/assets/11506578/8088b7b6-d126-413b-a54e-167b10404500)


## Test

- `make test-all`
- `Ran GUI and Data Viewer`
- `Tested Params form`

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? TODO

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd9e344bb00c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.