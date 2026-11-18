# Issue

**Title:** Changed parameters

## Description

# Overview

Baseline programming for viewing changed parameters, including change set calculations and preliminary GUI work. This also fixes some bugs in the parameters form.

## Ticket

- https://www.pivotaltracker.com/story/show/175193924
- https://www.pivotaltracker.com/story/show/183134229
- https://www.pivotaltracker.com/story/show/183133776

## Contributions

- Added calculations for computing the differences between two parameters files.
- GUI widgets for displaying a parameter change set.
- Bug fixes for GUI float widgets which were rounding some parameters to predetermined minimum and maximum values.
- Added code to compute the number of decimals to display (and button increment value) for float inputs based on the initial value provided.

## Test

- `make unit-test`
- Verified that the parameters form displays the correct default values for 'High Voltage Threshold Value' and 'Low Voltage Threshold Value'
- Verified that the parameters form shows 3 decimal places for 'Static Trigger Offset' field.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2af61aa38c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.