# Issue

**Title:** Add jitter to matrix and time tests

## Description

# Overview

Add stim_jitter parameter to Matrix. Add jitter to time test verifications to help in testing different stimuli configurations.

## Ticket

https://www.pivotaltracker.com/story/show/183548761

## Contributions

- `matrix/calibration.py`: add reference to stim_jitter, apply to generate stimuli method
- `timing_verification.py`: added jittered timing to both RSVP and Matrix time tests

## Test

- `make test-all`
- `bcipy --task "Matrix Time Test Calibration" -nv`
- `bcipy --task "RSVP Time Test Calibration" -nv`

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here. N/a

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? TODO

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `574e7ba56e7a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.