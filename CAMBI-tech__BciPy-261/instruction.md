# Issue

**Title:** Matrix Copy Phrase Task

## Description

# Overview

Added a Matrix Copy Phrase Task.

## Ticket

https://www.pivotaltracker.com/story/show/180699453

## Contributions

- Refactored Copy Phrase Task:
     - Use display methods rather than directly writing to properties.
     - Pass paradigm to session data.
- Created new Matrix Copy Phrase Task, which subclasses RSVP Copy Phrase.
- Matrix Display Refactors:
    - Removed unused variables.
    - Eliminated redundant creation of TextStim elements which affects screen draw time.
    - Use configured parameters for pause length, rather than hardcoded values.
    - Added configuration to distinguish between inquiries that display the target and those that don't.
    - Simplified trigger handling.
    - Converted fixation display to be rendered as the entire matrix with all elements highlighted.
- Fixed bugs in demo code.
- Fixed display issues with matrix timing task.
- Documented display parameters required for Matrix tasks that differ from RSVP.

## Test

- Ran all unit tests.
- Ran matrix demos.
- Ran Matrix Calibration Task.
- Using the model from the offline analysis, ran the Matrix Copy Phrase task.
- Confirmed the session data was generated correctly.
- Confirmed the appropriate trigger data was generated.
- Ran the Matrix Timing Task.

https://user-images.githubusercontent.com/2153447/211689840-4c4a4d5e-4c62-4255-9bf6-b9a3c26537ba.mov

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98042d63d2ff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.