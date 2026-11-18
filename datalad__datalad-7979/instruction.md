# Issue

**Title:** perf(path): speed up parent path checks -- 64% less time

## Description

## TL;DR

- Speed up `get_parent_paths` when checking repository paths on POSIX.
- Return early for valid plain POSIX paths. The original checks stay as the fallback.
- ASV target benchmark (one submodule in a subdirectory): 1.869 ms → 0.667 ms, 64.3% less time.
- Native tests: `python -m pytest -q -p datalad.pytest_plugin datalad/support/tests/test_path.py` — 6 passed.

## What & Why

`get_parent_paths` calls `_get_parent_paths_check` for every path and parent. The check calls the absolute-path wrapper and builds relative-path prefixes each time. Most repository paths are already valid plain strings.

For those POSIX paths, return early after simple `str` tests. `os.name == 'posix'` is decided once at import time (`_ON_POSIX`). The fast path is POSIX only, because on Windows `isabs()` also accepts paths such as `C:/x`. All other inputs go through the original checks, so errors and results stay the same.

## Validation

Medians of 3 runs × 15 timeit samples on Python 3.12, Linux x86_64, one CPU core. Inputs are the `benchmarks/support/path.py` setup (3,680 paths). Base is `4cdd58b`.

| Situation | Before | After | Change |
| --- | --- | --- | --- |
| One parent below a subdirectory | 1.869 ms | 0.667 ms | 64.3% less time |
| One top-level parent | 1.859 ms | 0.659 ms | 64.6% less time |
| 30 top-level parents, return only parents | 2.075 ms | 0.868 ms | 58.2% less time |
| 30 top-level parents, keep unmatched paths | 2.282 ms | 0.997 ms | 56.3% less time |
| No parents | 0.1 µs | 0.1 µs | No detected change |

An exhaustive comparison of all 18,662 short paths built from `a`, `b`, `/`, `.`, `..` and `\`, with both separators, gives the same result (accepted, or the same exception) as the original checks.

Native tests: `python -m pytest -q -p datalad.pytest_plugin datalad/support/tests/test_path.py` — **6 passed**.

## Why this is safe and easy to maintain

The fast path is one `if` with a comment, and it only accepts paths that the full checks also accept. The original validation stays unchanged below it as the fallback.
Outputs and error messages stay unchanged. The path tests cover both separators, invalid paths, duplicate paths, and deepest-parent selection.

## PR checklist

- [x] Explain the changes and why they help.
- [ ] Generate a changelog snippet with the `CHANGELOG-missing` label.

Suggested labels: `semver-performance`, `CHANGELOG-missing`.

## AI assistance

This PR was prepared with AI assistance from Aiden. Candidates were tracked with Weco Observe.

Weco share link: https://dashboard.weco.ai/share/TkYpQM-1NGZQPq3jo5SR4JOSEu0rImJQ

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4cdd58b243ba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.