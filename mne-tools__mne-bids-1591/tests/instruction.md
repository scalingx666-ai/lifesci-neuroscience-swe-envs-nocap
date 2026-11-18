# Issue

**Title:** FIX: more generous scans.tsv reading

## Description

Mirrors #1587 for `scans.tsv`. Three small fixes in `_handle_scans_reading`:

1. Malformed `acq_time` (`""`, `"NaN"`, non-ISO strings) now warns and leaves `meas_date` unchanged instead of crashing on `strptime`.
2. Recording absent from the `filename` column now warns and skips instead of raising. The close-matches diagnostic from `_verbose_list_index` is preserved in the warning text.
3. Header-only `scans.tsv` short-circuits instead of `IndexError` on `fnames[0].suffix`.

Also: parse `acq_time` via `datetime.fromisoformat` to accept ISO 8601 variants (space separator, explicit `+HH:MM` offsets, microsecond precisions other than 6 digits). Naive parses still defer to `_convert_dt_to_utc` (post-#1556); tz-aware parses skip straight to `.astimezone(UTC)`.

## Reproducer (end-to-end `read_raw_bids`)

```python
import openneuro
from mne_bids import BIDSPath, read_raw_bids

openneuro.download(
    dataset="ds006377",
    target_dir="/tmp/ds006377",
    include=["sub-225/sub-225_scans.tsv",
             "sub-225/nirs/sub-225_task-001RestingLH_run-1_nirs*",
             "dataset_description.json", "participants.tsv"],
)
bp = BIDSPath(subject="225", task="001RestingLH", run="1",
              datatype="nirs", suffix="nirs", extension=".snirf",
              root="/tmp/ds006377")
raw = read_raw_bids(bp)
print("meas_date:", raw.info["meas_date"])
```

`sub-225_scans.tsv` has empty `acq_time` cells (`filename\tacq_time\nnirs/...\t\n`).

| | result |
|--|--|
| `main` | `ValueError: time data '.0' does not match format '%Y-%m-%dT%H:%M:%S.%f'` (in `datetime.strptime`) |
| this PR | `RuntimeWarning: ... contains an invalid acq_time value: ''. Leaving raw.info['meas_date'] unchanged.` — read continues, `meas_date` retained from the SNIRF file (`2022-05-17 12:37:15+00:00`) |

Other affected dataset: `ds003844` has `acq_time=1934-09-01T13:42:17.9008789` (7-digit microseconds) — this PR truncates via `fromisoformat` rather than crashing. Discovered ingesting OpenNeuro datasets with [eegdash](https://github.com/bruAristimunha/eegdash). Supersedes #1532 (closed by me as too broad).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1157d639a90d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.