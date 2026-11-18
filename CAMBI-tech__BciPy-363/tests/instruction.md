# Issue

**Title:** Saved Device Status

## Description

# Overview

Ensure that the device status configured in the parameters file overrides the preconfigured value in devices.json

## Ticket

https://www.pivotaltracker.com/story/show/188529396

## Contributions

- Added unit tests for the acquisition helper module.
- Slight refactor to make the initialization of the device status more testable.

## Test

- Ran all unit tests
- Ran a sample calibration to ensure that the devices.json in the output folder had the expected values.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad649387db76`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.