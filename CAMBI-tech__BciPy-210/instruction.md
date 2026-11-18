# Issue

**Title:** #181490020 ; Remove old lm params

## Description

# Overview

Removed legacy parameters related to running the language model in a containerized environment.

## Ticket

https://www.pivotaltracker.com/story/show/181490020

## Contributions

- Removed extra parameters in both the main parameters file as well as the test resource.

## Test

- Ran all unit tests to confirm that they still worked.
- Grepped source code to ensure that the parameters were no longer in use in any demo scripts or documentation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24c07169372d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.