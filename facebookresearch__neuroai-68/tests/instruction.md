# Issue

**Title:** Replace deprecated pick_types() with pick() in Nieuwland2018Large

## Description

- `mne.io.RawArray.pick_types()` is a legacy function that emits a `NOTE` deprecation warning on every call; MNE recommends using `inst.pick()` instead.
- Replaces `raw.pick_types(eeg=True, stim=True)` with `raw.pick(["eeg", "stim"])` in `Nieuwland2018Large._load_raw`.
- Behaviour is identical, verified with an isolated script that runs both calls on the same synthetic raw object and asserts equal channel lists.

<details>
<summary>Verification script</summary>

```python
# uv run python test_pick.py
import mne
import numpy as np

sfreq = 500
n_times = sfreq * 2

ch_names = ["Fp1", "Fz", "Cz", "Pz", "EOG", "STI 014"]
ch_types = ["eeg", "eeg", "eeg", "eeg", "eog", "stim"]


def make_raw() -> mne.io.RawArray:
    info = mne.create_info(ch_names=ch_names, sfreq=sfreq, ch_types=ch_types)
    data = np.random.default_rng(0).standard_normal((len(ch_names), n_times))
    return mne.io.RawArray(data, info, verbose=False)


raw = make_raw()
print("Before:", raw.ch_names)

# legacy — emits NOTE warning
raw_legacy = make_raw()
raw_legacy.pick_types(eeg=True, stim=True)
print("pick_types():", raw_legacy.ch_names)

# current — silent
raw_new = make_raw()
raw_new.pick(["eeg", "stim"])
print("pick():      ", raw_new.ch_names)

assert raw_legacy.ch_names == raw_new.ch_names, "Channel lists differ!"
assert set(raw_new.get_channel_types()) == {"eeg", "stim"}
print("OK — identical results.")
```

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `06a4d37400c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.