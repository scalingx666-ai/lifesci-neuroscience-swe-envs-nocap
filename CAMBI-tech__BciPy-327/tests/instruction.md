# Issue

**Title:** Offset analysis updates

## Description

# Overview

Add support for determining offsets between timing verification Tasks (Ex. RSVPTimingVerificationCalibration) and RawData with a photodiode trigger column. This is useful for setting up new systems and preventing errors before an experiment begins.

## Ticket

- https://www.pivotaltracker.com/story/show/178696232
- https://www.pivotaltracker.com/story/show/187636698

## Contributions

- Fixed bug with Matrix Timing Verification
- Moved offset script to a module in helpers. 

## Test

- `make test-all`
- `make offset`
- `make offset-recommend`

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? In-line and README updates

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? Yes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c7d0d175e0ca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.