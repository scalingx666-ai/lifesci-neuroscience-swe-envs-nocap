# Issue

**Title:** [ENH] load neurosynth studyset efficiently for processing

## Description

<!---
This is a suggested pull request template for NiMARE.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
https://github.com/neurostuff/NiMARE/blob/main/CONTRIBUTING.md#pull-requests
-->

<!-- Please indicate after the # which issue you're closing with this PR.
This is helpful for the maintainers AND will magically close the issue when this
pull request is merged!
https://help.github.com/articles/closing-issues-using-keywords -->
Closes # .

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

-
-

## Summary by Sourcery

Introduce lightweight, lazily materialized Studyset and StudysetView workflows optimized for loading and decoding large Neurosynth-style datasets without fully rebuilding nested Study graphs.

New Features:
- Add convert_neurosynth_to_studyset for efficiently building Studyset objects directly from Neurosynth/NeuroQuery files, with optional lazy materialization.
- Support constructing Studyset and StudysetView instances directly from cached Dataset-style tables for execution-oriented workflows without nested Study graphs.

Enhancements:
- Refine Studyset to support lazy materialization of nested Study/Analysis graphs, including execution-context attachment and dictionary export that triggers materialization only when needed.
- Optimize StudysetView slicing and table-cache handling to operate directly on cached tables when available, avoiding unnecessary Studyset materialization.
- Integrate coordinate-space transformation into Neurosynth Studyset construction to ensure coordinates match the requested target space.

Tests:
- Add tests verifying CorrelationDecoder can operate on lazily cached Studysets.
- Add tests confirming lazy Studysets materialize only upon nested Study access and that StudysetView slicing uses cached tables without requiring materialization.
- Add a smoke test for convert_neurosynth_to_studyset to validate fast Neurosynth Studyset construction and annotations wiring.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `479f118eb24b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.