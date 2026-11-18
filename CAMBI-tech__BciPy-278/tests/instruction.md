# Issue

**Title:** add Tobii / PsychoPy display convert methods

## Description

# Overview

Added two conversion methods to `helpers/convert.py` to support going in between Tobii and PsychoPy norm units.

## Ticket

- https://www.pivotaltracker.com/story/show/184861219

## Contributions

- `convert.py`: added `tobii_to_norm` and `norm_to_tobii` methods

## Test

- `make test-all`

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here.

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? TODO

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `574e7ba56e7a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.