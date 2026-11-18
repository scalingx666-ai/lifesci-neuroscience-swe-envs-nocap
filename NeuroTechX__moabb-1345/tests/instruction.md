# Issue

**Title:** perf: lazy imports across subpackages and vectorize runtime bottlenecks

## Description

## Summary

Implements PEP 562 module-level `__getattr__` lazy imports across MOABB subpackages and speeds up hot runtime blocks identified via `cProfile` block profiling:

1. **Lazy Imports across Package Hierarchy (``)**:
   - `moabb/__init__.py`, `moabb/benchmark.py`: Defer heavy subpackage and third-party imports (`mne`, `pandas`, `sklearn`, `pyriemann`, `matplotlib`) until accessed or executed (`import moabb`: **2524 ms -> 21 ms**, **120x faster**).
   - `moabb/datasets/__init__.py`, `moabb/datasets/bnci/__init__.py`, `moabb/datasets/utils.py`: Lazily import dataset modules on attribute access and defer `_init_dataset()` until `dataset_list` / `dataset_dict` / `dataset_search()` is accessed (`from moabb.datasets import BNCI2014_001`: **2357 ms -> 993 ms**, **2.4x faster**).
   - `moabb/paradigms/__init__.py`, `moabb/evaluations/__init__.py`, `moabb/pipelines/__init__.py`, `moabb/analysis/__init__.py`: Resolve public classes and functions via PEP 562 `__getattr__` and cache in `globals()`.
   - `moabb/datasets/base.py`, `moabb/datasets/bids_interface.py`: Defer `FixedPipeline`, `SetRawAnnotations`, and `get_digest` imports to method execution so importing a dataset does not pull in `sklearn`, `scipy.stats`, or `moabb.analysis`.

2. **Runtime Block Speedups**:
   - **Block 1 (`dataset_search` & `BaseDataset.__init__`)**: Precompile regex patterns (`_CAMEL_KEBAB_RE`, `_ABBREV_SUB_RE`, `_SESSION_RUN_RE`, `_UNIT_SUFFIX_RE`) and cache `is_abbrev` with `@lru_cache(maxsize=512)` (**53.5 ms -> 22.3 ms**, **2.4x faster**).
   - **Block 5 (`Results` HDF5 I/O)**: Batch HDF5 slice writes in `Results.add` instead of per-row hyperslab writes, delegate `Results.not_yet_computed` to `batch_not_yet_computed` (single HDF5 open), and pass explicit `dtype="f4"` (**244.4 ms -> 121.1 ms**, **2.0x faster**).
   - **Block 6 (`meta_analysis`)**: Vectorize `compute_pvals_wilcoxon` (batch `scipy.stats.wilcoxon(..., axis=0)`), `_pairedttest_exact` / `_pairedttest_random` (matrix multiplication `perms @ data`), `compute_effect`, `compute_dataset_statistics` (direct DataFrame construction without double `melt` + `merge`), and `find_significant_differences` (**4038.6 ms -> 182.2 ms**, **22.2x faster**).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7017ee534628`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.