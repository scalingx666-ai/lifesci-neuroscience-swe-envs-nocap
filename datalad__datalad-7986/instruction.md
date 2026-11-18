# Issue

**Title:** perf(path): 3.4x faster get_filtered_paths_ (8000 paths, 20 filters)

## Description

## TL;DR

- This PR makes `get_filtered_paths_` in `datalad/support/path.py` faster, as used by `GitRepo.get_submodules_`.
- It splits plain `str` paths with `str.split('/')` and keeps an index into the sorted filter list.
- 8000 paths with 20 directory filters: 22.94 ms -> 6.63 ms per call, 71% faster.
- `python3 -m pytest -q datalad/support/tests/test_path.py` passes (6 passed).

## What & Why

Before, the function built one `PurePosixPath` for each path and each filter. Most of the time went into this parsing. The merge loop also dropped the first filter with `filter_paths_parts[1:]`, which copies the list on each step. It also sliced both parts tuples on each comparison.

Now, plain relative `str` paths are split on `'/'`. Empty and `'.'` parts are dropped, as `PurePosixPath` does. Other inputs (absolute paths, `Path` objects) still use `PurePosixPath`, so their checks and error messages stay the same. The merge loop moves an index instead of copying the list. It slices a tuple only for the prefix test. The sorted parts tuples and the selection rules do not change, so the function yields the same paths in the same order.

## Results

Best of 7 timing repeats per call, Python 3, one isolated CPU core:

| Situation | Before | After | Change |
|---|---|---|---|
| 8000 paths, 20 directory filters, `include_within_path=True` | 22.94 ms | 6.63 ms | 71% faster |
| 8000 paths, 20 directory filters, `include_within_path=False` | 23.02 ms | 6.39 ms | 72% faster |
| 2000 paths, 250 deep filters | 6.21 ms | 1.55 ms | 75% faster |
| 300 submodule paths, 100 filters inside them | 0.86 ms | 0.14 ms | 84% faster |
| 4 paths, 2 filters | 13.2 µs | 2.2 µs | 83% faster |
| 2000 `PurePosixPath` paths (no fast split) | 5.40 ms | 4.82 ms | 11% faster, no slowdown |

## Why this is safe and easy to maintain

The change touches only `get_filtered_paths_` and is about 30 lines. Each path keeps the same parts tuple, so sorting and selection work as before. The test `test_get_filtered_paths_` in `datalad/support/tests/test_path.py` covers `'.'`, `'..'`, absolute paths, `PurePosixPath` inputs and both `include_within_path` modes. We also compared the output with the old code on many more inputs, including `'//'`, trailing `'/'` and duplicates.

## Validation

- `python3 -m pytest -q datalad/support/tests/test_path.py -k test_get_filtered_paths_`: 1 passed, 5 deselected.
- `python3 -m pytest -q datalad/support/tests/test_path.py`: 6 passed.
- A larger mixed workload (the cases above plus edge cases) took 533-541 ms before and 160-177 ms after, in three runs. Each run checked that the output matched the old code exactly.

Benchmark reproduction for the main row:

```sh
python3 -m timeit -s "import random; from datalad.support.path import get_filtered_paths_ as f; p=[f'd{i//100}/s{i//10}/f{i}.txt' for i in range(8000)]; random.Random(0).shuffle(p); fl=[f'd{i}' for i in range(0, 80, 4)]" "list(f(p, fl, include_within_path=True))"
```

## PR checklist

- [x] Provide an overview of the changes you're making and explain why you're proposing them.
- [x] Create a changelog snippet. Please add the `CHANGELOG-missing` and `semver-performance` labels; I cannot set labels.
- [ ] Include `Fixes #NNN`. There is no related issue.

## AI assistance

This PR was prepared with AI assistance from Aiden. Candidates were tracked with Weco Observe.

Weco share link: https://dashboard.weco.ai/share/6dMg_KZBeJDlK6xVcBUDGtsDbxew38MQ

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `adcfb674975b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.