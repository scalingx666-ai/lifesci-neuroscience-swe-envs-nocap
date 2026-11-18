# Issue

**Title:** Orchestrator parameters

## Description

# Overview

Added functions for parsing, serializing, and validating a series of Orchestrator actions

## Ticket

[Pivotal Ticket](https://www.pivotaltracker.com/story/show/187263322)

## Contributions

- Adds function for parsing string of actions into a list of tasks (actions are not defined as anything beyond task types as of now)
- Adds function for validating that string of actions is in the correct format
- Adds function for converting a list of tasks into an action string

## Test

- Adds unit test for parsing a single action, multiple actions, and invalid actions
- Adds unit test for serializing a single action and multiple actions
- Adds task for validating valid and invalid action strings

## Documentation

- Functions are documented with docstrings

## Changelog

- changelog updated

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2b0660849a7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.