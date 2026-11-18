# Issue

**Title:** Matrix Bug: fix for scp flashing

## Description

# Overview

Using the set opacity method, fix the flashing issue after upgrading psychopy for the release candidate.

## Ticket

[Ticket](https://www.pivotaltracker.com/story/show/183148629)

## Contributions

- `matrix/display.py`: update matrix display to use the `setOpacity()` method instead of setting the opacity property directly. 

## Test

- `make test-all`
- `bcipy --task "Matrix Calibration"` and ensured the flashing worked as expected

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here.

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? N/a

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24ffd10d7b8d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.