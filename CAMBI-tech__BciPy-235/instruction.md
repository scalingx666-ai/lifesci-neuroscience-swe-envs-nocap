# Issue

**Title:** User ID reset bug and cleanup

## Description

# Overview

This PR fixes the user ID input bug where the user input in GUI would reset after editing a parameter file. Modifies the offline analysis call to use the correct parameters link (as opposed to the default). Added alert functionality to the GUI to let experimenters know when an experimental session has been completed. 

## Ticket

- https://www.pivotaltracker.com/story/show/182776444
- https://www.pivotaltracker.com/story/show/178695784
- https://www.pivotaltracker.com/story/show/182101849

## Contributions

- `BCInterface.py`: added refresh argument to `update_user_list` method to prevent resetting after parameter changes. Added a play_sound method after an experiment session has been completed.  Added parameter flag to offline analysis call. Factor out static_font_size to help with later GUI updates.
- `parameters.json`: updated name `offline_analysis_tone` to `alert_sound_file` to be more widely applicable 
- `helpers/stimuli.py`: remove post stim buffer (duration calculation more sufficient)

## Test

- went through the AC of the ticket
- `make test-all`
- Ensured experiment could run and alert plays when self.alert=True
- Ensured offline analysis still runs as expected from the GUI

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Yes?

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? Yes!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `15d5e70cd6cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.