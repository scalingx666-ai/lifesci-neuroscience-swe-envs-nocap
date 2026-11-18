# Issue

**Title:** Experiment Protocol Gui

## Description

# Overview

Add ability to define task protocols in the experiment gui

## Ticket

[Pivotal Ticket](https://www.pivotaltracker.com/story/show/187701295)

## Contributions

- Add additional dropdown that displays all available tasks
- Add UI elements for reordering and removing tasks
- Add protocol saving to `experiment.json`
- Refactor formatting for create experiment button

## Test

- No testing for GUI besides manually inspecting app.

## Documentation

- Buttons in the new interface are clearly labeled and code is commented.

## Changelog

- Changelog updated

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0da74ab09ce0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.