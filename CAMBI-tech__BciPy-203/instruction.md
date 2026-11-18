# Issue

**Title:** Fixed backspace prob

## Description

# Overview

Modified Copy Phrase Wrapper to always use the configured backspace probability, overriding the value provided by the language model.

## Ticket

[https://www.pivotaltracker.com/story/show/181350204](https://www.pivotaltracker.com/story/show/181350204)

## Contributions

- Updated the behavior of the `sym_appended` to update the provided probability when the list of probs already contains that value.
- Updated the `UniformLanguageModel` to remove redundant code for configuring the backspace probability.
- Added unit tests to cover edge cases.

## Test

- Ran all unit tests.
- Ran the Copy Phrase task with both GPT2 and Uniform language models to ensure that the configured backspace probability was used and the other probabilities were adjusted.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e22fc9560c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.