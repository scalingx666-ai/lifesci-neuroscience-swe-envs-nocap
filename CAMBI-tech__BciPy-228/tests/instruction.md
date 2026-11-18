# Issue

**Title:** use a better default timeout

## Description

# Overview

Updated the default timeout to 3 seconds (from 10 seconds). 

## Ticket

https://www.pivotaltracker.com/story/show/182228549
 
## Contributions

- `gui/BCInterface.py`: updated the default timeout to 3 seconds (from 10 seconds). 

## Test

- Loaded the GUI and ensured timeout still worked.

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here.

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? N/a

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c95035d9ffe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.