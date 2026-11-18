# Issue

**Title:** #182408060 ; Fake data text for LM

## Description

# Overview

Ensure that spelled text is provided to the language model when using fake data.

## Ticket

https://www.pivotaltracker.com/n/projects/2460065

## Contributions

- Updated Copy Phrase task to override the Copy Phrase Decision Maker state after each inquiry. This state is sent to the language model when a new series is initialized.
- Fixed some broken unit tests.

## Test

- Ran unit tests
- Ran the Copy Phrase task using fake data; analyzed the log file to determine that the language model was getting called correctly. This was done with both Uniform and GPT2.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2fa24ce49367`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.