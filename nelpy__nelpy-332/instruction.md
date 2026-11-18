# Issue

**Title:** Use observed duration for partial decoding windows

## Description

When an epoch is shorter than the requested decoding window, `decode1D` and `decode2D` aggregate the available spikes but previously used `ds * w` as the Poisson likelihood exposure. This biases the posterior. Use the epoch's actual bin count for that window's exposure and document the partial-window behavior.

Add regression coverage for epochs shorter than, equal to, and longer than the window, mixed epoch lengths, and windows without spikes. Full-window results, posterior boundaries, and the existing no-spike prior policy are preserved. Eight regression cases fail on the original code and pass with this fix.

Validation:
- `pytest tests/test_decoding.py -q`: 22 passed, 1 skipped.
- `pytest tests -q`: 523 passed, 3 skipped.
- `ruff check .`: passed.
- `ruff format --check nelpy/decoding.py tests/test_decoding.py`: passed.
- `git diff --check`: passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35e10220cb23`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.