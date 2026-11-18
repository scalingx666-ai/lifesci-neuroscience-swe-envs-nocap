# Issue

**Title:** Speed up interval and event slicing

## Description

## Summary

This PR speeds up nelpy interval operations and time-domain slicing hot paths using vectorized NumPy operations while preserving the existing public API and slicing semantics.

Changes include:
- Adds fast paths for singleton and merged `IntervalArray` intersections.
- Vectorizes `IntervalArray.merge()` grouping with cumulative max/reduce operations.
- Vectorizes analog-signal interval bound lookup.
- Replaces per-epoch event slice concatenation with a vectorized take-index helper for `EventArray`/`SpikeTrainArray` slicing.
- Adds regression tests for interval intersections and event slicing edge cases.
- Adds future follow-up performance notes to `developnotes.md`.

## Benchmark Results

Environment: `D:\github\nelpy\.conda\python.exe`, Python 3.14.3, NumPy 2.4.4.

### Interval and Analog Slicing Benchmarks

| Workload | Old | New | Speedup |
|---|---:|---:|---:|
| Merge 250,000 sorted intervals | 0.106s | 0.0048s | 22.3x |
| Singleton interval intersection, 1,000,000 intervals | 0.0386s | 0.0198s | 2.0x |
| 8h analog signal, 1250 Hz, 2 channels, 5,000 epochs | 0.110s | 0.0249s | 4.4x |
| Same, 20,000 epochs | 0.452s | 0.093s | 4.9x |
| Same, 100,000 epochs | 2.38s | 0.453s | 5.3x |

### Event Slicing Benchmark

Workload: 300 cells, 8h session, 10 Hz mean firing rate, 288,000 spikes/cell, 86,400,000 total spikes.

| Epochs | Old slice-list | New take-index | Kept events | Speedup |
|---:|---:|---:|---:|---:|
| 2,000 | 0.993s | 0.206s | 166,079 | 4.83x |
| 10,000 | 4.227s | 0.436s | 825,358 | 9.69x |
| 25,000 | 10.562s | 0.736s | 2,070,573 | 14.36x |
| 100,000 | 42.902s | 2.534s | 8,263,354 | 16.93x |

## Validation

```powershell
D:\github\nelpy\.conda\python.exe -m pytest tests\test_IntervalArray.py tests\test_EventArray.py tests\test_AnalogSignalArray.py
D:\github\nelpy\.conda\python.exe -m ruff check nelpy\core\_intervalarray.py nelpy\core\_analogsignalarray.py nelpy\core\_eventarray.py tests\test_IntervalArray.py tests\test_EventArray.py
D:\github\nelpy\.conda\python.exe -m ruff format nelpy\core\_intervalarray.py nelpy\core\_analogsignalarray.py nelpy\core\_eventarray.py tests\test_IntervalArray.py tests\test_EventArray.py --check
git diff --check
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `546ad019dccb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.