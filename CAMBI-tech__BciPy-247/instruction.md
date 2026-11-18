# Issue

**Title:** Export the device used as a useable config file

## Description

# Overview

After starting a session, export a derived devices.json to capture what was used during the session. 

## Ticket

[ticket](https://www.pivotaltracker.com/story/show/182859531)

## Contributions

- `acquisition/devices.py`: added a to_dict method to DeviceSpec
- `helpers/acquisition.py`: added a kwarg to init_eeg_acquisition (export_spec) to export the configured device.
- `helpers/save.py`: export device spec to json method

## Test

- `make test-all`
- `bcipy` and ensured the used device spec information is present as `devices.json `

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here.

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? TODO

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2fa24ce49367`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.