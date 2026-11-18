# Issue

**Title:** Fix Raw.crop with reset_first_samp=True misaligning annotations and data

## Description

`Raw.crop(..., reset_first_samp=True)` filtered the annotations while `first_samp` still held the cropped offset and never shifted their onsets, so they ended up late by `first_time + tmin`. The onsets are now shifted by `first_time` and `_cropped_samp` is reset before `set_annotations`. `_first_samps` / `_last_samps` are left untouched since they index the files, which also fixes reading wrong data from non-preloaded files and the wrong `first_samp` on concatenated raws.

<details>
<summary>Reproduction</summary>

```python
import matplotlib.pyplot as plt
import mne
import numpy as np

mne.viz.set_browser_backend("matplotlib")
info = mne.create_info(["EEG1", "EEG2", "EEG3"], sfreq=100.0, ch_types="eeg")
data = np.zeros((3, 500))  # 5 s of data
data[:, 200:300] = 1.0  # square pulse from 2.0 to 3.0 s
raw = mne.io.RawArray(data, info)
raw.set_annotations(mne.Annotations(onset=2.0, duration=1.0, description="pulse"))

cropped = raw.copy().crop(tmin=1.0, tmax=4.0, reset_first_samp=True)
print(cropped.first_samp, cropped.annotations.onset)  # main: 0 [2.]  fix: 0 [1.]

kwargs = dict(
    start=0,
    scalings=dict(eeg=1.0),
    time_format="float",
    show_scrollbars=False,
    show_scalebars=False,
    block=False,
)
raw.plot(duration=5, **kwargs)  # annotation covers the pulse at 2-3 s
cropped.plot(duration=3, **kwargs)  # pulse now at 1-2 s, is the annotation too?
plt.show(block=True)
```

</details>

![main vs fix](https://github.com/mscheltienne/mne-python/blob/pr-assets/crop_reset_first_samp_main_vs_fix.png?raw=true)

AI disclosure: Claude (Opus 5.5) implemented the fix and the test and produced the figure; I reviewed the changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b46a31b407a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.