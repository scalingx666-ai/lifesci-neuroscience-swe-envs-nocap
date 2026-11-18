# Issue

**Title:** Device channel specs

## Description

# Overview

Set channel spec information in devices.json. Removed aliases.

## Ticket

https://www.pivotaltracker.com/story/show/182849439

## Contributions

- Updated devices.json to include channel spec information.
- Removed devices that were aliases.
- Updated code that was using the alias devices.

## Test

- Ran unit tests and demos.
- Ran an RSVP Calibration using streamed data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f3baeeb2275`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.