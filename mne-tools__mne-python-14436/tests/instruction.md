# Issue

**Title:** ENH: Allow setting non-UTC timezone in set_meas_date

## Description

### summary of changes

.
this builds on and finishes the abandoned PR #10970 by @TzionaN, rebased onto the current `main` and adapted to `mne/_fiff/meas_info.py`.

before this, `set_meas_date` raised a `ValueError` if you gave it a timezone-aware `datetime` object with a non-UTC timezone, while setting `info['utc_offset']` directly was deprecated.

this change does these things:
1. `set_meas_date` now accepts timezone-aware non-UTC `datetime` objects, converts them to UTC for `info['meas_date']`, and fills `info['utc_offset']` automatically with the formatted offset (for example `+02:00` or `-05:00`).
2. sets `info['utc_offset'] = None` when `meas_date` is in UTC or `None`.
3. adds parsing of the offset in ISO8601 strings in `_handle_meas_date`.
4. adds unit tests in `mne/_fiff/tests/test_meas_info.py` (including a FIFF I/O save/reload roundtrip and anonymization) and in `mne/tests/test_annotations.py`.
5. adds a changelog entry in `doc/changes/dev/9953.bugfix.rst`.

<details>
<summary>Demonstration</summary>

```python
from datetime import datetime, timezone, timedelta
import mne

info = mne.create_info(ch_names=["EEG 001"], sfreq=1000.0, ch_types="eeg")
tz_paris = timezone(timedelta(hours=2))
dt = datetime(2026, 10, 20, 14, 30, tzinfo=tz_paris)

# main: ValueError: Date must be a timezone-aware datetime object: ...
# fix: converts to UTC for meas_date and sets utc_offset = "+02:00"
info.set_meas_date(dt)
print("meas_date:", info["meas_date"])   # 2026-10-20 12:30:00+00:00
print("utc_offset:", info["utc_offset"]) # +02:00
```

</details>

### ai disclosure

i used an ai assistant to trace how `utc_offset` is formatted in FIFF and how `Info.set_meas_date` is structured across `mne/_fiff/meas_info.py` and `mne/annotations.py`. i checked the offset calculation logic, wrote the round-trip and anonymization tests, formatted the code with `ruff`, and ran the pytest suite locally before pushing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `924975212e93`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.