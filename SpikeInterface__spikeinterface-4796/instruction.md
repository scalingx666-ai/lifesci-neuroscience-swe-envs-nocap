# Issue

**Title:** Fix sorting times segment propagation

## Description

When creating a `sorting` from `NumpySorting.from_sorting(sorting)` the sorting `t_start` are not propagated and so can be lost. (e.g. when creating a `sorting_analyzer` from a `sorting`). 

This fix also propagates `t_start_native` just in case, which I saw but am not really sure what it is! So maybe that's not appropriate. Also adds a test.

Actually, maybe a better fix is to use `register_recording()` instead of `sorting._recording = source_sorting._recording`
and delete the new addition?

MRE:

```
from spikeinterface.core import (
    NumpySorting,
    generate_recording,
    generate_sorting,
)

# Make a recording with segment times at 5 and 120s
recording = generate_recording(
    num_channels=2,
    durations=[1.0, 1.0],
)
recording.shift_times(5.0, segment_index=0)
recording.shift_times(120.0, segment_index=1)

sorting = generate_sorting(
    durations=[1.0, 1.0],
    sampling_frequency=30_000,
    firing_rates=10.0,
    num_units=2,
)
sorting.register_recording(recording)

converted = NumpySorting.from_sorting(sorting)

# The segment times and spike times are wrong after conversion
print([sorting.get_start_time(i) for i in range(2)])
print([converted.get_start_time(i) for i in range(2)])

unit_id = sorting.unit_ids[0]
print(sorting.get_unit_spike_train(unit_id, segment_index=0, return_times=True)[:3])
print(converted.get_unit_spike_train(unit_id, segment_index=0, return_times=True)[:3])
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b0aba1918922`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.