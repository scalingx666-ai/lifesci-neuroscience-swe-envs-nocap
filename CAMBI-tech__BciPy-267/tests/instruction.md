# Issue

**Title:** IP calibration

## Description

# Overview

Add inquiry preview feature to RSVP calibration.

## Ticket

- https://www.pivotaltracker.com/story/show/183903260

## Contributions

- `RSVP Calibration`: add inquiry preview properties to the display init
- `RSVP Display`: add preview_calibration arg to `do_inquiry` method

## Test

- `make test-all`
- `bcipy --task "RSVP Calibration"` with and without preview_inquiry enabled
- `bcipy --task "RSVP Copy Phrase"` to make sure nothing impacted with the update

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? added docstrings and updated where needed.

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? yes!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `09c68736ab6d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.