# Issue

**Title:** neuralset: ~5x faster standardize_events auto_fill; nearest-layer sel…

## Description

…ection; non-integer audio sample rates

Three small neuralset changes.

- `standardize_events(auto_fill=True)` loops over the rows of `events.to_numpy()` instead of `DataFrame.apply(axis=1)`, whose per-row `pd.Series` dominated first-time `Study` loads (~5x faster on a 56k-event timeline; output identical, checked with `assert_frame_equal(check_exact=True)`).
- HuggingFace extractors select layers by rounding (`round` instead of `int`), so a relative depth picks the nearest hidden state.
- Audio extractors accept drift-corrected, non-integer sample rates (e.g. 44078.8 Hz) by rounding them, which stretches the signal by less than 1e-5.

## What does this PR do?

<!-- Brief description of the change. -->

## Related Issues

<!-- e.g. ,  -->

## Checklist

- [ ] Tests added or updated
- [ ] Docstrings updated for any changed public APIs
- [ ] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e3d681eda47b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.