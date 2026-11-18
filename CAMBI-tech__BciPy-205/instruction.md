# Issue

**Title:** Matrix calibration

## Description

# Overview

Updates to matrix calibration stimuli generation as requested after demo.  Added parameter to toggle between randomly and evenly distributed target positions within inquiry.  Additional parameter to specify percentage of inquiries with a target that is not flashed in the inquiry (nontarget inquiries).  Increased contrast in flashed stimuli.  

## Ticket

https://www.pivotaltracker.com/story/show/181038822

## Contributions

- task/paradigm/matrix/calibration.py: added two new parameters, enum called target_positions which can be either random or distributed and decides whether the target positions are random or evenly distributed, and integer called nontarget_inquiries that specifies a percentage 0-100 of inquiries that will not contain the target stimuli
- helpers/stimuli.py: added new function to choose evenly distributed target positions based on inquiry attributes, updated stimuli generation function to include nontarget inquiries and collect evenly distributed data for different target positions
- helpers/tests/test_stimuli.py: added new tests to thoroughly check different options for random or distributed target positions, and different values 0-100 percent for amount of nontarget inquiries
- parameters/parameters.json: added two new parameters, target_positions and nontarget_inquiries
- display/paradigm/matrix/display.py: changed values of stimuli opacity to flash with a more noticeable contrast from other stimuli

## Test

- helpers/test/test_stimuli.py: added unit tests to test stimuli generation with different values for two new parameters
- bcipy --task "Matrix Calibration": stimuli are chosen and flashed correctly with updates

## Documentation

- Are documentation updates required? In-line, README, or [documentation] Added in-line comments to explain updates

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f99c0dd51a8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.