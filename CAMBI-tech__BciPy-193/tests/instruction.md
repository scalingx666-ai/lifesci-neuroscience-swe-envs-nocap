# Issue

**Title:** Language model

## Description

# Overview

Added GPT2 language model using Huggingface implementation. Integrated with the existing language model base class. The language model makes character-level predictions given left context (evidence strings).

## Ticket

[https://www.pivotaltracker.com/story/show/178695479](url)

## Contributions

- Implemented a new GPT2LanguageModel class
- Addressed issues raised during meetings with Tab, Matt and Niklas
- Made changes based on discussions during meetings
- The module is able to make character-level predictions based on left context, using marginalized character-level probability distribution returned by the GPT2 language model

## Test

- test_gpt2.py in the test folder is an example test script that can be used to test the module.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `be5b4e8af230`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.