# Issue

**Title:** Parameters Save As Bug

## Description

# Overview

Updated the main GUI with the new parameter location after using the Save As functionality in the params_form GUI.

## Ticket

https://www.pivotaltracker.com/story/show/185720052

## Contributions

- Updated params_form to return the json data path of the parameters file.
- Refactored main GUI to use subprocess check_output to get the new value and use that to update the parameter location.

## Test

- Ran the main GUI, edited the parameters, saved the parameters file to a new location, closed the params form, then started an experiment. Confirmed that the experiment was using the new parameters. Inspected the experiment parameters.json to confirm that the parameter_location was referencing the correct value.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c00998028b7c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.