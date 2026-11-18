# Issue

**Title:** ERP viz demo fix

## Description

# Overview

Update demo_visualizaton.py to provide a save path if the flag is set. Update typing in helpers/visualization. 

## Ticket

No ticket, this was fixed while debugging during an experiment.

## Contributions

- `demo_visualization.py`: ensure a path is passed to visualize path if save flag is set
- `helpers/visualization.py`: update type signature 

## Test

- Define the steps used to test your code here. Include unit and integration test steps!

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here.

## Changelog

- Is the CHANGELOG.md updated with your detailed changes?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bbeb9cc0e9a9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.