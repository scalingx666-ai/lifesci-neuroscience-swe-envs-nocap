# Issue

**Title:** Inquiry preview bugfix

## Description

# Overview

Add a new property to InquiryPreviewProperties; use this to determine if it should be shown during RSVP calibration.

## Ticket

https://www.pivotaltracker.com/story/show/188174632

## Contributions

- Add property to InquiryPreviewProperties, update tests.

## Test

- `make test-all`
- 
## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here. Updated docstrings. 

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? TODO.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `586e4d10a065`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.