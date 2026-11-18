# Issue

**Title:** upgrade psychopy

## Description

# Overview

Upgraded PsychoPy to the latest and ensured all builds passed. The most recent release would have required us to deprecate python 3.7. 

## Ticket

https://www.pivotaltracker.com/story/show/182808689

## Contributions

- `requirements.txt`: upgrade PsychoPy, remove pyglet (each os wants a different version 🤦🏼‍♂️)
- `setup.py`: bumped the rc
- `.github/workflows/main.yml`: force macOS and windows to use WxPython 4.1.1 or it errors. Later builds better support this, but we cannot use the very latest Psychopy (2022.2.4)

## Test

- Local builds + ensure the github action workflow passes 

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here.

## Changelog

- Is the CHANGELOG.md updated with your detailed changes?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8f9ce7c4e7e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.