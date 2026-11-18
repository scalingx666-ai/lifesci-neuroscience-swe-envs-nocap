# Issue

**Title:** Server metadata

## Description

# Overview

Refinements to LSL server to use the device ChannelSpec information for generating metadata.

## Ticket

https://www.pivotaltracker.com/story/show/179542651

## Contributions

- Updated lsl_server
- Updated code for discovering devices to provide a timeout if the device is not available.

## Test

- Started a demo Eyetracker server; used pylsl to inspect the stream metadata to confirm that it had the correct shape and values.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bda9a8e52606`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.