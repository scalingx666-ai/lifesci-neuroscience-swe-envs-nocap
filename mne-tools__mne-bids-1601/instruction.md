# Issue

**Title:** FIX: allow non-numeric run values in BIDSPath if check=False

## Description

One-character fix in `mne_bids/path.py`: gate the "run is not an index" check on `self.check`, so `BIDSPath(..., run="5H", check=False)` succeeds while the strict default still rejects.

```diff
-                if isinstance(val, str) and not val.isdigit():
+                if isinstance(val, str) and not val.isdigit() and self.check:
                     raise ValueError(f"{key} is not an index (Got {val})")
```

This matches the existing `check=False` escape hatch already used for `suffix`, `space`, `datatype`, and `extension`.

## Real-world dataset blocked today

[`ds003190`](https://openneuro.org/datasets/ds003190) ships VHDR files with `run-5F` and `run-5H` entities. eegdash hit this and silently dropped 104 files via a workaround (, later extended in ).

```python
from mne_bids import BIDSPath

BIDSPath(subject="01", run="5H")
# main: ValueError: run is not an index (Got 5H)

bp = BIDSPath(subject="01", run="5H", check=False)
# this PR: bp.basename == "sub-01_run-5H"
```

|        | result                                              |
|--------|-----------------------------------------------------|
| `main` | `ValueError: run is not an index (Got 5H)`          |
| this PR| `BIDSPath(...).basename == "sub-01_run-5H"`         |

## End-to-end `read_raw_bids` works

The fix carries through to `read_raw_bids`. Synthetic dataset with `run-5H` files on disk:

```python
from mne_bids import BIDSPath, read_raw_bids

bp = BIDSPath(subject="01", task="t", run="5H", datatype="eeg",
              suffix="eeg", extension=".edf", root=root, check=False)
raw = read_raw_bids(bp)
# OK: 139 channels, 3072 samples, channels.tsv sidecar resolved correctly
```

`_find_matching_sidecar` is unaffected — it already sets `check=False` internally on the bids_path copy it uses.

## Tests

Folded into existing `test_path.py` tests rather than a new file:

- `test_make_filenames`: positive (`check=False`) + negative (default raises) for `run="5H"`.
- `test_bids_path`: positive + negative for `datatype="fnirs"` (covering the same `check=False` escape hatch already used by some real-world datasets that ship `fnirs/` instead of the spec's `nirs/`).

Strict default behavior is unchanged.

## Related

Part of the broader effort to read non-spec OpenNeuro datasets (#1591, #1593, #1599). The other items in the table at  (case-mismatched entities, separator typos, fuzzy participant_id) are matching/parsing concerns, not BIDSPath construction — those need separate PRs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `313cabe21d77`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.