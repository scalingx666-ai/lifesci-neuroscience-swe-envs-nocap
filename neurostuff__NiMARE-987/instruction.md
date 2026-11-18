# Issue

**Title:** fix pickling for a materialized studyset

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

Ensure nimads Studyset objects can be safely pickled and unpickled while preserving execution context and mutation tracking, and extend test coverage for Studyset interoperability across estimators, workflows, and transformers.

Enhancements:
- Make Studyset.get_labels accept scalar, list, tuple, and numpy array IDs for more flexible label querying.
- Implement custom pickling support for Studyset, Study, and Analysis objects to drop live mutation callbacks on dump and restore mutation tracking on load.
- Add a Studyset-based test fixture and strengthen Dataset/Studyset parity tests, including slicing, merging, copying, and shared query methods.
- Add a smoke test ensuring ImageTransformer writes generated image paths back into Studyset.images without mutating the original object.
- Tighten several Studyset execution tests by using smaller slices and disabling diagnostics to reduce test runtime and resource usage.
- Set a sphinx-gallery thumbnail for the JSON dataset example script.

Tests:
- Add pickle round-trip tests for Studyset, including cases with execution context (target/masker) and verification that nested mutations still invalidate caches after unpickling.
- Introduce parameterized smoke tests to exercise common Dataset/Studyset APIs (IDs, masker, get_* methods, query helpers, slice/merge, copy, and pickling) against real test data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `27b47d99061d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.