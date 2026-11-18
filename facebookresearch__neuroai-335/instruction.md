# Issue

**Title:** neuralset: sort extractor event_types so their order does not change the cache uid

## Description

Makes the order of an extractor's `event_types` irrelevant to its cache uid: `("Text", "Image")` and `("Image", "Text")` gave two cache folders for the same features.

- `BaseExtractor` sorts and deduplicates tuple `event_types` (inherited by subclasses that redeclare the field).
- `AggregatedExtractor` sorts the `event_types` it builds from a set, whose order varied between processes.
- Uids of already-sorted tuples are unchanged; unsorted ones change once (e.g. the `clinical_event` LabelEncoder target).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab2537659142`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.