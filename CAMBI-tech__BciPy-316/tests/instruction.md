# Issue

**Title:** Oracle Language Model

## Description

# Overview

Added a new language model that has knowledge of the target copy phrase and boosts the probability of the next target.

## Ticket

https://www.pivotaltracker.com/story/show/187083845

## Contributions

- Added new language model and tests

## Test

- Added unit tests
- Ran Copy Phrase task using the Oracle LM

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2594d66ad001`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.