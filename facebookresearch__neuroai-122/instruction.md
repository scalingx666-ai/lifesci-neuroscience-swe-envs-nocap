# Issue

**Title:** Fix duplicate Sentence rows in AddSentenceToWords with multiple Text events

## Description

## What does this PR do?

AddSentenceToWords called `_extract_sentences` inside the loop over `Text` contexts, so each pass re-derived sentences from the full `events` table and appended them again. Timelines with several `Text` rows could end up with duplicate `Sentence` events.
Sentence extraction now runs once after all contexts have been matched to words.

## Checklist

- [x] Tests added or updated
- [x] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b3b8b2da5bdc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.