# Issue

**Title:** Simulator Verbose Mode

## Description

# Overview

Added simulator flag to control the verbosity of the output.

## Ticket

https://www.pivotaltracker.com/story/show/188328498

## Contributions

- Changed log level for many statements.
- Added a verbose parameter used to control the log level.
- Deleted generated triggers.txt

## Test

- Ran the simulator using both modes and compared the outputs

## Discussion

These changes still output all of the files, but the file contents are much shorter. I opted to keep log files for each run in case any errors were encountered. If we did not have logs at all then these would be missed.

The largest output files are the individual session.json files for each run. These are used for generating the overall metrics. If the simulation artifacts are still too large we can do some further refactoring to accumulate metrics values as we go and delete each run's session.json after that run's data has been accumulated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8d5c964839b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.