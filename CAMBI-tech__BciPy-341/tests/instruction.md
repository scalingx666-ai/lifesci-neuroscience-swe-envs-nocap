# Issue

**Title:** Session data and logging

## Description

# Overview

Fixed logging issues. Made output data consistent with the rest of BciPy.

## Contributions

* Output simulation run as session.json data that can be analyzed and visualized with existing BciPy tools.
* Refactored SimRunner to always create the same directory structure. Moved directory creation code out of runner; added logging file for the whole simulation as well as a separate log file per run. Refactor to only save parameters.json once per simulation.
* Fixed logging so data engine code is now logging correctly.
* Added a argument parameter to main for specifying the number of times the simulation should be run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `38cff8f94552`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.