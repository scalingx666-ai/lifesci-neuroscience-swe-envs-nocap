# Issue

**Title:** Artifact Detection and BCI-Fit Artifact Report

## Description

# Overview

Added an Artifact Detection class to the `signal.evaluate` module. Updated the artifact report section to include information about artifacts detected.

## Ticket

https://www.pivotaltracker.com/story/show/187526878
https://www.pivotaltracker.com/story/show/187833646

## Contributions

- `artifact.py`: module added to detect and report on artifacts in EEG data. This replaces the old evaluator and rules modules.
- `report.py`: updated the artifact report to extract relevant information and add to the PDF report.

## Test

- `make test-all` & using the `demo_report.py` to produce reports. 

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Added docstrings and extensive documentation to the Evaluate README. 

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? TODO

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `72dd333aec24`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.