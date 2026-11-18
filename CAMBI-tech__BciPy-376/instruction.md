# Issue

**Title:** Simulator Replay Script

## Description

# Overview

Integrate replay script into simulator

## Ticket

https://www.pivotaltracker.com/story/show/188805610

## Contributions

- Refactored the replay_session script to work with the simulator framework.
- Created a ReplayTask to iterate through a previously recorded session.
- Created a ReplaySampler
- Added a module to compute the metrics specific to this

## Test

- Added unit tests
- Ran the replay session with a single data directory and with multiple.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `18a1d03e1379`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.