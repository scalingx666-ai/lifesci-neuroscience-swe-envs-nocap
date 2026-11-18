# Issue

**Title:** Let `get_streams` work from the path alone on Neuralynx, Biocam and Blackrock

## Description

When adding `exclude_filename` to `NeuralynxSortingExtractor` (the recording extractor already had it and both go through the same `NeuralynxRawIO`) I realized that `get_neo_streams("neuralynx", folder_path)` throws a `TypeError`. The extra arguments in `map_to_neo_kwargs` have no defaults so the call fails on our own signature before neo is reached. Biocam is the same and blackrock never passed `gap_tolerance_ms` through there at all.

I added the defaults that the constructors already pass. All these errors have the same shape so I think it is good to add a general check instead of a test for the three formats that I found. I am adding it to `RecordingCommonTestSuite` to avoid this problem in the future.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dbe2e7539ab6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.