# Issue

**Title:** Home use testing: screen refresh alert and offline analysis updates

## Description

# Overview

Tested release candidate in a variety of home use scenarios. One issue observed in using a secondary usb-c monitor was if a disconnect occurs or the battery runs out, the primary monitor refresh rate may change to default settings. This can be configured per display arrangement to some degree in Windows; however, to prevent issues in the future and add some awareness of the monitor requirements, I've added an alert for low monitor refresh rates. In the future, we might also consider a consistent frame rate check using PsychoPy to determine monitor stability. 

## Ticket

https://www.pivotaltracker.com/story/show/184589205

## Contributions

- `system_utils.py`: update the screen properties method to return the refresh rate, add `is_screen_refresh_ok` check.
- `validate.py`: update validate_bcipy_session to include a check for screen refresh
- `offset_anaysis.py`: update to script with documentation and to support future factoring into codebase 

## Test

- Make test-all; Added tests for system_util alerts
- Photodiode testing
- Configured the monitor with different refresh rates ensuring < 120 would be flagged

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Yes

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? Yes!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `520c0783ab02`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.