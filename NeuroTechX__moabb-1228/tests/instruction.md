# Issue

**Title:** DOC: metadata-only paradigm compatibility recipe

## Description

## Summary
- Add a metadata-only example using the existing public MotorImagery.is_valid API, without loading recordings, constructing evaluations/Results, enumerating datasets, or training.
- Explain explicit versus default n_classes semantics, one/two declared sessions versus actual data, unresolved remote metadata, and unknown evaluation compatibility.
- Add a focused regression that executes the example with file/network/data/evaluation/training entry points guarded and checks metadata, paradigm, and environment preservation.

## Deliberately limited scope
This is a documentation recipe, not a new combined evaluation validator. Evaluation predicates are instance methods and construction initializes Results and filters the supplied dataset list. Rather than introduce unsupported dummy receivers or refactor those predicates, this reuses the existing public paradigm API and leaves evaluation compatibility null. No evaluation semantics, package API, dependencies, workflow, competition settings, or dataset loader changes.

## Validation
- Recipe + existing paradigm tests: 103 passed (existing warnings only).
- Existing cross-session compatibility/reason and cross-subject compatibility tests: 3 passed.
- Dedicated no-I/O recipe regression: passed separately.
- All applicable pre-commit checks and git diff --check: passed.
- Independent source QA before push: APPROVE, no blocking defects; reviewer reran the focused test and reviewed all three files.
- Local Sphinx is unavailable; normal existing docs CI will build the gallery example. No laptop dataset downloads.

Normal required reviews/checks must pass before merge; no bypass requested.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5a860a600974`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.