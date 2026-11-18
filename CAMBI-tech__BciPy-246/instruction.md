# Issue

**Title:** Convert: add BDF support and fix static offset bug

## Description

# Overview

Refactored the convert to edf method. Add convert to bdf method for better export resolution. Ensured the static offset output in the parameters file is accounted for. Add a pre-filter option that will apply the default transform using the filter parameters in the parameters.json stored in the session directory. Ensured the correct annotation channels are used. Upgraded pyedflib to latest version. 

## Ticket

https://www.pivotaltracker.com/story/show/182395017

## Contributions

- `convert.py`: Refactored the convert to edf method into reusable parts (`pdf_convert`). Add convert to bdf method for better export resolution. Ensured the static offset output in the parameters file is accounted for. Update documentation. Calculate the correct annotation channels needed instead of only alerting. 
- `demo_convert.py`: Added a plot option for file viewing, using -d for the directory arg instead. Added the export to bdf option. 
- `test_convert.py`: refactored setup needed in the `create_bcipy_session_artifacts`. Add tests for added methods. 


## Test

- `make test-all`
- Used `demo_convert.py` and shared the data with @danielpklee for review. I shared a .edf and .bdf file. 

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here.

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? Yes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2fa24ce49367`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.