# Issue

**Title:** Task return object

## Description

# Overview

- Add `TaskData` return object

## Ticket

[Pivotal Ticket](https://www.pivotaltracker.com/story/show/187766235)

## Contributions

- Adds `TaskData` dataclass
- Adds save path and task dicrionary properties
- Updates all tasks to return an instance of TaskData
- Returns session data with `TaskData` instances

## Test

- Existing tests updated to check `TaskData` properties

## Documentation

- No documentation updates required yet

## Changelog

- Changelog updated

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5075355c25fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.