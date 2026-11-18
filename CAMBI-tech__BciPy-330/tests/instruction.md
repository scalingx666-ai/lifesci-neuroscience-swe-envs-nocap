# Issue

**Title:** Calibration task refactor

## Description

# Overview

Refactored calibration tasks to pull out common workflow into a parent task. In the process, added session logging to Matrix and RSVP tasks.

## Ticket

https://www.pivotaltracker.com/story/show/187637041
https://www.pivotaltracker.com/story/show/187636806
https://www.pivotaltracker.com/story/show/187636860

## Contributions

- Created a BaseCalibrationTask to codify the calibration workflow. Factored the execute method into smaller methods to provide more granularity for subclasses to customize behavior. Note that the execute loop is now iterating through a generator, rather than through a list of items. This allows subclasses more flexibility to dynamically determine the next inquiry to display and to terminate the task if a sufficient amount of data has been recorded.
- Updated other calibration tasks to subclass BaseCalibrationTask and specialize where needed (ex. display, inquiry generation, session data).
- Updated unit tests; fixed typing issues; etc.
- Added session data for Matrix Calibration
- Added session data for RSVP Calibration

## Test

- Ran unit tests
- Ran all calibration tasks (RSVP, Matrix, VEP, timing tests). Ran offline analysis on RSVP calibration.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69dfe484970d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.