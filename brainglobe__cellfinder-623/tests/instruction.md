# Issue

**Title:** Mark curation points with a single vstack instead of a loop

## Description

## Description

**What is this PR** — [x] Bug fix

`CurationWidget.mark_point_as_type` appended selected points one at a time, reassigning the `Points.data` property inside a loop over `selected_data`. Each assignment re-validates the whole array and emits change events, so marking *N* points is **O(N²)**. 

This PR indexes all selected rows at once and does a single `vstack`/`.data` assignment. Same rows in the same order. 

```python
selected_points = layer.data[list(layer.selected_data)]
destination_layer.data = np.vstack((destination_layer.data, selected_points))
```

## Benchmark

**Time** — old loop vs. single vstack against a real `napari.layers.Points` layer (destination layer = 500 points):

| selected points | loop (current) | single vstack | speedup |
|-----------------|----------------|---------------|---------|
| 10              | 21 ms          | 5.7 ms        | 4×      |
| 25              | 45 ms          | 5.8 ms        | 8×      |
| 50              | 90 ms          | 6.0 ms        | 15×     |
| 100             | 176 ms         | 6.2 ms        | 29×     |
| 200             | 359 ms         | 6.2 ms        | 57×     |
| 500             | 916 ms         | 6.2 ms        | 148×    |
| 1000            | 1.9 s          | 6.6 ms        | 292×    |
| 2000            | 4.5 s          | 7.6 ms        | 592×    |
| 5000            | 15.1 s         | 9.4 ms        | 1613×   |

**Peak memory** — numpy allocations (`tracemalloc`). The single version also lowers peak memory ~2×, because the loop rebuilds the whole growing destination each iteration (holding two copies at its peak) while the single vstack touches it once:

| selected points | loop (current) | single vstack |
|-----------------|----------------|---------------|
| 50              | 4.80 MB        | 2.40 MB       |
| 500             | 4.82 MB        | 2.42 MB       |
| 5000            | 5.04 MB        | 2.64 MB       |

System: Intel i7-12800H (20 threads), 30 GiB RAM, Ubuntu 22.04 (kernel 6.8.0-111), Python 3.11.15, numpy 2.4.2, napari 0.6.6.

## How has this PR been tested?

`KERAS_BACKEND=torch pytest tests/napari/test_curation.py` passes (existing tests cover `mark_point_as_type`; behaviour unchanged). Benchmark outputs verified identical (same shape and values).

## Is this a breaking change?

No.

## Checklist

- [x] The code has been tested locally
- [ ] Tests added — behaviour unchanged, already covered by `test_curation.py`
- [ ] Docs updated — n/a

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2180fcce95ba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.