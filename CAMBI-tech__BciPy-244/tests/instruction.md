# Issue

**Title:** signal model loaded log

## Description

# Overview

Log signal model loaded and update offline analysis logging to include static offset.

## Ticket

https://www.pivotaltracker.com/story/show/182005523

## Contributions

- `helpers/load.py`: log.info what model was loaded
- `offline_analysis.py`: update to log info after loading parameters to better structure and include static offset

## Test

- `make test-all`
- Ran offline analysis and a copy phrase to observe the output was correct

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? None required

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? Will do

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6153e16ab8f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.