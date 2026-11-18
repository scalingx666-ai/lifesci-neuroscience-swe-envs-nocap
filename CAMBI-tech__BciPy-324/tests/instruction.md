# Issue

**Title:** GitHub actions MacOS build fix

## Description

# Overview

Fixes issue where macOS builds on the GitHub actions would fail, and refactors GitHub actions to use makefile.

## Ticket

[Pivotal ticket](https://www.pivotaltracker.com/story/show/187517298)

## Contributions

- Fixed macOS build issues in GitHub actions
- Refactored GitHub actions configuration to use the makefile for most of its install tasks.

## Test

- Successfully ran the install process locally on my mac
- Ran the GitHub actions for this branch, and successfully completed all builds.

## Documentation

Updated comment in `m2chip_install.sh` to indicate it has been tested on M3. other than that, the changes don't require additional documentation

## Changelog

- Changelog is updated

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ddd5d6692c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.