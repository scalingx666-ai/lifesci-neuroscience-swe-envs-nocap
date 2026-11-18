# Issue

**Title:** Honor MNE download-directory changes across all datasets

## Description

Changing the download location in the MNE configuration (`set_download_dir`) did not reach datasets that had already been accessed: `get_dataset_path` persists a per-dataset `MNE_DATASETS_<SIGN>_PATH` entry mirroring `MNE_DATA` on first use, and that entry was never refreshed, so datasets kept resolving to the old folder.

```python
from moabb.utils import set_download_dir
from moabb.datasets.download import get_dataset_path

set_download_dir("/data/a")
get_dataset_path("WEIBO", None)   # -> /data/a  (persists MNE_DATASETS_WEIBO_PATH)
set_download_dir("/data/b")
get_dataset_path("WEIBO", None)   # before: /data/a  |  after: /data/b
```

### Changes

- **`moabb/utils.py`** — `set_download_dir` now realigns every `MNE_DATASETS_*_PATH` entry that still mirrors the previous `MNE_DATA` value (new `_propagate_download_dir` helper). Keys the user pointed elsewhere are left untouched; no paths are deprecated. Directory creation now uses `os.makedirs(..., exist_ok=True)` to close a concurrent-creation race.
- **`moabb/tests/test_download.py`** — integration test parametrized over the full `dataset_list`. It intercepts `get_dataset_path` (patching both the `download` module and per-module bindings) to resolve each dataset's location without network I/O, then asserts a config change moves the resolved path instead of reverting. Covers 156 datasets; skips 3 that don't use the shared `MNE_DATA` mechanism (`FakeDataset`, `FakeVirtualRealityDataset`, `RomaniBF2025ERP`).
- **`moabb/tests/util_tests.py`** — unit test covering propagation to per-dataset keys and preservation of independently-configured keys.
- **`docs/source/whats_new.rst`** — changelog entry.

### Notes

- No per-dataset download functions needed patching: all problematic datasets route through `get_dataset_path`, so the single fix in `set_download_dir` covers them. The integration test confirms this (all 156 covered datasets fail without the fix, pass with it).
- `RomaniBF2025ERP` manages its own `data_folder` and is intentionally out of scope for the shared-config mechanism.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29a6a56cd15f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.