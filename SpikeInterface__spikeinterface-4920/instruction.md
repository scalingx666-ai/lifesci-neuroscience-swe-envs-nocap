# Issue

**Title:** Fix `signed=True` saturation periods in `detect_and_remove_artifacts`

## Description

`detect_and_remove_artifacts(..., method="saturation", method_kwargs=dict(signed=True))` fails, because `_check_periods` rejects any field beyond the base period dtype. Also, periods reloaded from JSON were always rebuilt with the base dtype, so the `sign` field was dropped.

This PR:
- lets `_check_periods` accept extra fields (the base fields are still required)
- keeps the `sign` field when reloading periods from JSON, including the empty-periods case
- adds a test for a JSON round-trip of signed and empty periods

**MRE**
```python
import numpy as np
import spikeinterface as si
import spikeinterface.preprocessing as spre

data = np.zeros((30000, 8), dtype="float32")
data[100:110] = 2000
data[5000:5003] = -2000
rec = si.NumpyRecording(data, 30000.0)
rec.set_channel_gains(1.0)
rec.set_channel_offsets(0.0)
rec = rec.save(folder="raw", overwrite=True)

rec_signed = spre.detect_and_remove_artifacts(
    rec, method="saturation", method_kwargs=dict(saturation_threshold_uV=1000, signed=True)
)
# main: ValueError: periods must be a np.array with dtype [...]

rec_signed.dump_to_json("signed.json")
print(si.load("signed.json").periods.dtype.names)
# this PR: ('segment_index', 'start_sample_index', 'end_sample_index', 'sign')
```

Note: if signed detection finds no periods, they reload with the base dtype, because there's no element to infer `sign` from.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e28d878e240`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.