# Issue

**Title:** Upgrade psychopy and add support for python3.9

## Description

# Overview

Upgrade to the latest PsychoPy and python versions. Add more features to the bcipy cli for ease of testing (no visualizations, fake data).

## Ticket
- https://www.pivotaltracker.com/story/show/183161084
- https://www.pivotaltracker.com/story/show/183538986


## Contributions

- `main.yml`: update builds to 3.8/3.9, add .whl and other install dependencies. 
- `README.md`: significant updates to the dependencies and installation sections
- `rsvp/display.py`: update to match PsychoPy updates 
- `main.py`: add command line options to the cli allowing bcipy to run with visualizations or fake data
- `shell/linux_requirements.sh`: to include reference to python 3.9 and `xvfb`
- `setup.py`: updates to allow differences in requirements between OS, version restrictions, and update to the latest release candidate 

## Test
- Make test-all

## Documentation
Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Yes, updated README and inline where appropriate. 

## Changelog
Is the CHANGELOG.md updated with your detailed changes? TODO

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a740bbafe4bb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.