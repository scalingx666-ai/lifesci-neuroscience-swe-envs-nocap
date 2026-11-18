# Issue

**Title:** MNE unit conversion

## Description

# Overview

Added unit conversion functionality for mne data. 

## Ticket

https://www.pivotaltracker.com/story/show/182310991

## Contributions

- `helpers/convert`: update convert_to_mne to accept volts as an argument. If False, it assumes mV and will apply a transformation to the data to ensure all MNE assumptions are met. 

## Test

- `pytest`
- `flake8 lint`

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Updated docstrings and inline documentation. 

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? TODO

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `149d7bfc6529`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.