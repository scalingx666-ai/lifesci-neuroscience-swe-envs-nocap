# Issue

**Title:** Enhance retrieval system with answer style configuration and input validation

## Description

Introduces a user-configurable answer-style prompt, adds PDF and image support to LLM calls (including batch), tightens citation/grounding rules in prompts, and adds tests for the new answer-style behavior.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2de94879b80d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.