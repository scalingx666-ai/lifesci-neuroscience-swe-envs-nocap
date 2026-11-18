# Issue

**Title:** Add support for Tobii Nano

## Description

# Overview

Added Tobii device spec and demo files useful in testing the integration.

## Ticket

https://www.pivotaltracker.com/story/show/182589601

## Contributions

- `devices.json`: added Tobii
- Added several demos and renamed the eye-tracking demo for clarity

## Test

- `make test-all`
- Acquired data with a Tobii Nano! 

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here. Not sure!

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? Not yet

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6fdc4fa68dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.