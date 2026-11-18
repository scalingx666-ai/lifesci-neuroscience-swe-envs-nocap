# Issue

**Title:** Button press fix

## Description

# Overview

Slightly adjust logic for button press evidence

## Ticket

https://www.pivotaltracker.com/story/show/180860945

## Contributions

- Adjust how button press evidence is used to compute likelihood updates. 
- Add more documentation and tests.

## Test

`xvfb-run --auto-servernum pytest bcipy/signal/tests/model/test_inquiry_preview.py --disable-warnings`

## Documentation

- Added doc strings

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `be5b4e8af230`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.