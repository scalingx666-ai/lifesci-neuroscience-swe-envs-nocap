# Issue

**Title:** Add event marking

## Description

A simple implementation of event markers that tie into the library.

All I've done is added an RxJS Subject to the MuseClient class, which can be imperatively trigged to send data with the new `injectMarker` function.

It's helpful in my app, specifically as it introduces a similar API to the Emotiv SDK.

If needed, I can throw a recipe or example into the documentation to show how one might merge the events stream in with EEG using the `withLatestFrom` operator.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f905fccdcd1a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.