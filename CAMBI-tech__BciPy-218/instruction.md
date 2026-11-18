# Issue

**Title:** Prevent GUI Double Clicks

## Description

# Overview

Added a BCIGui timer that is used in BCInterface to prevent double-clicking behavior. 

## Ticket

- https://www.pivotaltracker.com/story/show/182039256

## Contributions

- `gui.main.py`: add timer
- `gui.gui_main.py --> gui.main.py`: refactor to match other modules while in release canditate
- `gui.BCInterfacy.py`: added an `action_disabled` and `_disable_action` methods to create a timer that would disable actions for a time (self.timeout). Add the `action_disabled` check to all clickable events in the GUI.

## Test

- `make test-all`
- Run the BCInterface.py GUI and try double-clicking buttons. Ensure that the defined timeout actions are possible again after the timeout.

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here. N/A

## Changelog

- Is the CHANGELOG.md updated with your detailed changes?  I will once approved! :D

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2d9b44016ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.