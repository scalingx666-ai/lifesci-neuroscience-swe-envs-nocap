# Issue

**Title:** FIX: detect TSV encoding before reading

## Description

.

Real-world OpenNeuro datasets sometimes ship `channels.tsv` (and friends) in `latin-1` rather than UTF-8 — typically because of the `µ` sign in the `unit` column. `_from_tsv` hardcoded `utf-8-sig` and crashed.

Add a small deterministic encoding detector and feed the result straight into `np.loadtxt`:

```python
def _detect_file_encoding(fname):
    raw = Path(fname).read_bytes()
    if raw.startswith(codecs.BOM_UTF8):
        return "utf-8-sig"
    if raw.startswith((codecs.BOM_UTF16_LE, codecs.BOM_UTF16_BE)):
        return "utf-16"
    try:
        raw.decode("utf-8")
        return "utf-8"
    except UnicodeDecodeError:
        return "latin-1"
```

I think it could potentially be used as complemented of #1531 by @scott-huberty.

## Reproducer (end-to-end `read_raw_bids` on a real OpenNeuro dataset)

```python
import openneuro
from mne_bids import BIDSPath, read_raw_bids

openneuro.download(
    dataset="ds004621",
    target_dir="/tmp/ds004621",
    include=["dataset_description.json", "participants.tsv",
             "sub-13/eeg/sub-13_task-rest_*"],
)
bp = BIDSPath(subject="13", task="rest", datatype="eeg",
              suffix="eeg", extension=".vhdr", root="/tmp/ds004621")
raw = read_raw_bids(bp, on_ch_mismatch="rename")
print(f"OK — {len(raw.ch_names)} channels, {raw.n_times} samples")
```

| | result |
|--|--|
| `main` | `UnicodeDecodeError: 'utf-8' codec can't decode byte 0xb5 in position 25: invalid start byte` (deep in `numpy.loadtxt`) |
| this PR | `OK — 127 channels, 711840 samples` |

The offending bytes are `\xb5V` (`µV`) in the `units` column of `sub-13_task-rest_channels.tsv`. Same pattern affects `ds003620` (160 files), `ds005692` (59 files), `ds004598` (20 files), `ds005691` (8 iEEG files), and more.

Tests cover the 5 encoding cases (ASCII / UTF-8 / UTF-8-BOM / UTF-16 / latin-1) plus an integration test that verifies the warning fires and `µV` is read correctly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `515db4404994`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.