# Issue

**Title:** Orchestrator actions

## Description

# Overview

Adds actions. These allow previously non task procedures to be run through the orchestrator

## Ticket

[Pivotal Ticket](https://www.pivotaltracker.com/story/show/187693597)

## Contributions

- Add `CodeHookAction`
- Add `CallbackAction`
- Add `OfflineAnalysisAction`
- Add orchestrator run save structure
- Refactor task registry slightly to allow for action parsing

## Test

- Ensure existing parsing tests are passing

## Documentation

- Comments have been added to necessary code

## Changelog

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1103585c523c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.