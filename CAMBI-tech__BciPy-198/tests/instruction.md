# Issue

**Title:** Ubuntu fix

## Description

# Overview

Added a try-catch to allow unit tests to pass in CI despite some memory issues running the unittests. No issues in collecting data were reported.

## Ticket

https://www.pivotaltracker.com/story/show/181196471

## Contributions

- update to github workflow to catch 134 status code; ensure unittests always attempt to run

## Test

- checked for passing workflow steps across OS 

## Documentation

- Are documentation updates required? N/A

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b672a4b3349`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.