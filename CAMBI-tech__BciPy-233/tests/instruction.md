# Issue

**Title:** Jitter

## Description

# Overview

Add a stimuli jitter parameter that will allow users to -/+ flash_time in seconds. 

## Ticket

[Ticket](https://www.pivotaltracker.com/story/show/182646315) 

## Contributions

- Added jitter parameter that is leveraged at all stimuli generation points
- Cleanup docstings and test_stimuli.py 
- Added validation to `calibration_inquiry_generator`


## Test

- `make test-all`
- IP calibration and copy phrase testing

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here. updated docstrings and added type annotations where possible.

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? yes!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f0269f1ed725`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.