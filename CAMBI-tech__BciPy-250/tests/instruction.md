# Issue

**Title:** Bug fixes: jitter, offline analysis, task complete alerting

## Description

# Overview

Bug fixes for the release candidate! Copy phrase jitter bug, where the jitter wasn't being factored into the calculation of buffer space needed for  data querying. Unreported offline analysis copy error for the play alert. Move task complete alerting to main and use it in the subprocess command in BCInterface.py.

## Ticket

https://www.pivotaltracker.com/story/show/183214254
https://www.pivotaltracker.com/story/show/183051997


## Contributions

- `offline_analysis.py`: bug fix (`self.parameters` --> `parameter`)
- `BCInterface.py`: remove play_sound and call it using bcipy cmd line util
- `main.py`: add documentation and alerting functionality to let the user know when the task is complete. Add it to the registered cmd line util. Remove raising of exceptions at the end, still logging.

## Test

- `make test-all`
- `bcipy`
- Ran the GUI and ensured tasks could be run and the alert is used at the end! 

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here. Updated where I thought necessary! 

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? None required all within the rc

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `56b188ff3b68`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.