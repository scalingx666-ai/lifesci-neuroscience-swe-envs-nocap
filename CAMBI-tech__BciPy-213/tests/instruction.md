# Issue

**Title:** Matrix timing validation

## Description

# Overview

Add a matrix timing calibration task to validate the timing of the Matrix animation using a photodiode.

## Ticket

- https://www.pivotaltracker.com/story/show/180816368

## Contributions

- `helpers/stimuli`: add `PhotoDiodeStimuli`
- `bcipy/display/paradigm/matrix/display.py` - update to allow for the setting of opacity for testing
- `bcipy/task/paradigm/matrix/timing_verification.py`- added task to flicker photodiode stimuli in the matrix grid. Default opacity is zero to allow for flickering behavior
- `bcipy/task/paradigm/rsvp/calibration/timing_verification.py` - update to use new photodiode enum
- `bcipy/task/start_task.py`&& `bcipy/task/task_registry.py`- register new matrix task

## Test

- `make test-all`
- `bcipy --task "Matrix Time Test Calibration"` 

https://user-images.githubusercontent.com/11506578/164299888-4420f5cc-08c2-40ee-954e-c61f7de3b091.mov

- `bcipy --task "RSVP Time Test Calibration"`

## Documentation

- Added docstrings, updated task README.md

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c865ba2e07ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.