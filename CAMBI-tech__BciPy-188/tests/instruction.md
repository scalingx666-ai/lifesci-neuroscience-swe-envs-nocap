# Issue

**Title:** Uniform Language Model

## Description

# Overview

Created a new UniformLanguageModel that uses the new LanguageModel base class. Refactored the existing code base to use the new model. 

## Ticket

https://www.pivotaltracker.com/story/show/178695693

## Contributions

- Created a new UniformLanguageModel class that provides equal probabilities for each symbol.
- Integrated the new LanguageModel API:
    - Refactored bci_main to ensure that a language model is always created for spelling tasks, using the uniform model by default.
    - Refactored language_model helper to simplify the creation of language models.
    - Added a `predict` model to the `PRELM` language model that can take the spelled text as a parameter. This method resets the server after every call.
    - Refactored CopyPhraseWrapper to call the `predict` method; removed the extraneous code for when no LM is present.

## Test

- Ensured that all unit tests pass.
- Ran Copy Phrase Task with no model selected to ensure the UniformModel is used by default and that parameters were correctly passed.
- Ran Copy Phrase Task with the `PRELM` and confirmed that this model is correctly configured.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98343fff0e7d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.