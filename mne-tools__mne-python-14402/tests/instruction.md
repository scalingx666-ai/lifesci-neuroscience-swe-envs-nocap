# Issue

**Title:** PERF: Optimize multidimensional indexing in Spectrum.get_data() and TFR.get_data()

## Description

#### reference issue

none. .

#### what does this implement/fix?

`BaseSpectrum.get_data` and `BaseTFR.get_data` picked channels, freqs and times with chained `np.take()` calls, and each one allocated a full new array:

```python
data = (
    self._data.take(picks, chan_axis)
    .take(freq_picks, freq_axis)
    .take(time_picks, time_axis)
)
```

now it's one `self._data[tuple(idx)]`. since `get_data()` is documented to return a copy, i check with `np.shares_memory` and only copy when basic slicing gave back a view. advanced indexing already copies, so nothing is copied twice.

#### additional information

- `Spectrum.get_data()` (100 epochs, 64 channels, 200 freqs): ~51.4 ms -> ~3.9 ms (~13x)
- `TFR.get_data()` (50 epochs, 60 channels, 40 freqs, 100 times): ~543.7 ms -> ~84.2 ms (~6.5x)
- added tests for both that check subsetting and that the result doesn't share memory with the original
- ai disclosure: used an ai assistant for the test scaffolding and benchmarks

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `995ee6255b04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.