# Issue

**Title:** Improving GPT2 language model prediction

## Description

# Overview

A new beam-search based method for GPT2 character prediction. The language model can predict multiple worldpieces and marginalize the word-level prediction to make character level prediction.

## Ticket

[https://www.pivotaltracker.com/story/show/181349709](url)

## Contributions

- Fixed the multiple spaces bug
- Improved the overall (ranked-based) performance on the ALS phrase dataset
- All letters in the alphabet (except for the backspace character) now have nonzero probability after interpolating with a unigram language model
- Smoothed the language model distribution with an exponential rescaling factor

## Test

- Run all unit tests existed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a67b3c90480`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.