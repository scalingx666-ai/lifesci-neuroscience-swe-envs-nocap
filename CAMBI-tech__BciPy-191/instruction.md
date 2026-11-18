# Issue

**Title:** Show target phrase at start of copy spelling and on pause screen

## Description

# Overview

Added a custom `wait_message` method to RSVP `CopyPhraseDisplay` to support display of target text during sessions.

## Ticket

- https://www.pivotaltracker.com/story/show/180154991

## Contributions

- `display/rsvp/mode/copy_phrase.py`: custom wait_message that draws static. Updated the location of the task bar / information & task text. I created a ticket to refactor and formalize this space. See https://www.pivotaltracker.com/story/show/180881866
- `task/paradigm/rsvp/copy_phrase.py`: update the initial task text

## Test

- `bcipy` to ensure no changes to calibration
- `bcipy --task "RSVP Copy Phrase"` to ensure the copy text is present at top, run the task, pause and ensure the same text appears
-   `make test-all`

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? N/A

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ebc2ef1620a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.