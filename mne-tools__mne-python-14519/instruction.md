# Issue

**Title:** ENH: Add segmentation support (n_per_seg, n_overlap, average) to multitaper PSD for continuous data

## Description

#### reference issue (if any)

.

#### what does this implement/fix?

right now, when we compute multitaper psd on continuous raw data (like 10-60 minutes at 1 kHz), the dpss tapers and ffts are calculated over the full length of the signal. if we also set a fixed bandwidth (for example `bandwidth=4.0`), it needs hundreds or thousands of dpss tapers as long as the whole signal. so it takes minutes to hours and uses a lot of memory.

as discussed in #11383, the agreed solution is to divide the signal into segments, apply the dpss windows on each segment, and average the spectra across the segments. it is similar to welch, but we still get the lower variance of dpss tapers in each segment.

in this PR i have added:
- the parameters `n_per_seg`, `n_overlap` and `average` (`'mean'`, `'median'`, `None`) to `psd_array_multitaper`.
- segment slicing without copying, using `np.lib.stride_tricks.sliding_window_view`.
- support in `Raw.compute_psd(method='multitaper', n_per_seg=...)` and in the `Spectrum` object. it keeps a `'segment'` dimension when the output is not averaged, and `'taper'` is placed correctly.
- the old behavior is same when `n_per_seg=None` (the default), so the unsegmented multitaper works as before.

#### additional information

**performance:**
- on a 60 s, 8-channel eeg recording with `bandwidth=4.0`, the unsegmented multitaper needs 239 tapers over 60,000 points, and it takes several minutes. with `n_per_seg=2000` (2 s window, 7 tapers) it takes only **0.76 s**.

**tests:**
i did not add new separate test functions. instead i added the cases in the existing tests:
- `test_psd`: added segmented multitaper (`n_per_seg=256, n_overlap=64`).
- `test_psd_array_welch_average_kwarg`: now runs for both `psd_array_welch` and `psd_array_multitaper`, and checks `average='mean'`, `average='median'` (chi-square bias correction through `_median_biases`), `average=None` and the output shapes.
- `test_complex_multitaper`: added `n_per_seg=(None, 128)`, to check complex fourier coefficients with many segments.
- `test_psd_array_welch_nperseg_kwarg`: added checks for `n_overlap >= n_per_seg`, negative `n_overlap`, and `output='complex'` with segment averaging.
- all the tests in `mne/time_frequency/tests/` pass on my machine.

**ai disclosure:**
the implementation was generated using Anthropic Claude and Google DeepMind agentic tools. i reviewed and guided it, and i checked the segment striding, the median bias scaling, the complex coefficient axes and the edge-case tests myself, and ran them locally before submitting.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a43fb22b9090`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.