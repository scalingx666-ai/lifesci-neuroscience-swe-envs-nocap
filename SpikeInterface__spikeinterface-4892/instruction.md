# Issue

**Title:** Fix legacy Mahalanobis metric parameters on load

## Description

Older saved waveform extractors can retain `isolation_distance` and `l_ratio` parameter keys after their metric names have been migrated to `mahalanobis`. This change migrates the parameter keys too. If the legacy configurations disagree, loading continues with the `isolation_distance` parameters and emits a warning explaining that choice.

The existing legacy-loading regression test checks the migrated keys and verifies that conflicting settings produce the warning without preventing the analyzer from loading.

Validation: the compatibility test module passed locally on Windows (2 passed, 1 skipped). The new conflict case failed with the previous exception and passed after the change. CI is rerunning.

Addresses #4742.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e03e6ed7bc3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.