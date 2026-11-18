# Issue

**Title:** Generate ERP figures after bcipy sessions

## Description

# Overview

Added a `visualize_session_data` method to `helpers/visualization.py`. This method is now used in `main.py` with the boolean visualize on `bci_main`. This results in an ERP image generated after each session (fake, calibration, copy phrase, etc.). It will fail to generate an image if no target or nontarget labels are found. 

## Ticket

[Ticket](https://www.pivotaltracker.com/story/show/183148942)

## Contributions

- `helpers/visualization.py`: new method `visualize_session_data` that leverages the existing `visualize_erp` function. 
- `offline_analysis.py`: by default, do not save the figures after training; assume this will happen after a session. This is helpful to know what channels etc., to include before training. 
- `main.py`: update bci_main to include a visualize boolean. Using the new `visualize_session_data` method, an ERP image is generated and saved to the session folder.

## Test

- `Make test-all`
- `Make integration-test`
- Run `bcipy` and ensure figures generate after the session. 

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Updated docstrings where appropriate.

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? Yes!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98042d63d2ff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.