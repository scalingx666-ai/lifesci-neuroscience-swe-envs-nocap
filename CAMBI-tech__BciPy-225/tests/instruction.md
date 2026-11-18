# Issue

**Title:** [Bug fix] Two presses needed to start copy phrase

## Description

# Overview

Removed `RSVPCopyPhrase.await_start` to prevent two presses from being necessary to start the copy phrase task.

## Ticket

https://www.pivotaltracker.com/story/show/182228537

## Contributions

- `task/paradigm/rsvp/copy_phrase.py`: removed await_start

## Test

- `Make test-all`
- bcipy --task "RSVP Copy Phrase"

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here. N/a

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? Yes!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `323b9e2fa81d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.