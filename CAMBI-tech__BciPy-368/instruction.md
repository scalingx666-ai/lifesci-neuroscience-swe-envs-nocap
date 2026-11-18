# Issue

**Title:** Simulator CLI/GUI

## Description

# Overview

Created a command line interface and GUI to assist with configuring parameters for a simulation.

## Ticket

https://www.pivotaltracker.com/story/show/188497024

## Contributions

- Added an interactive mode to the existing command line interface. `bcipy-sim -i`.
- Added a GUI to run the simulator: `bcipy-sim-gui`
- Both modes produce similar results but the GUI has better support for selecting data directories from more loosely structured data folders.
- Added an argument to customize the output folder of the simulation.
- Simulator bug fixes

## Test

- Ran all unit tests
- Ran the simulator CLI and GUI code to confirm output as expected.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b256aed38502`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.