# Issue

**Title:** Random uniform

## Description

# Overview

Updated Copy Phrase task machinery so that when using the Uniform language model, the first Inquiry of symbols are selected randomly, rather than taking the first n letters of the alphabet.

## Ticket

https://www.pivotaltracker.com/story/show/186571653

## Contributions

- Updated the NBestStimuliAgent used in Copy Phrase to randomize the order of inputs prior to sorting by descending probability. This ensures that symbols with the same probability values are ordered randomly.
- Updated the default value of the lm_backspace_prob  parameter so by default it is given the same initial probability as any other symbol.
- Bug fix

## Test

- Added unit tests for Stimuli agents
- Ran all linting and unit tests
- Ran a Copy Phrase task and inspected the session.xlsx output to determine that the symbols were initially ordered randomly, followed by the highest likely symbols.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb3a60a1697d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.