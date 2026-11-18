# Issue

**Title:** Fix sign dependent flat line detection in get_railed_percentage

## Description

`DataFilter.get_railed_percentage` decides whether a channel is flat before it converts the peak amplitude into a percentage of the ADC range. The flat line test in `get_railed_percentage` is written as `(abs (raw_data[i - 1]) - raw_data[i]) > 0.00001`, so the closing parenthesis sits after the `abs` call rather than around the difference. It compares the absolute value of the previous sample against the signed value of the current sample instead of measuring how far apart two consecutive samples are.

That makes the check depend on the sign of the data. For a positive signal the condition only becomes true when the signal is decreasing, so a monotonically rising channel never clears the flag and is reported as 100 percent railed. For a negative signal `abs (prev) - cur` is `-prev - cur`, which is positive for essentially any pair of negative samples, so the flag is cleared immediately and a channel stuck at a negative value is never detected as railed. Detecting a stuck channel is the main thing this function exists to do, and a negative rail is just as common as a positive one. Separately, the running maximum is declared `int cur_max = abs (raw_data[0])`, so the fractional part of every peak is discarded and peaks below 1 uV collapse to exactly 0.

The fix moves the parenthesis so the difference is taken before `abs`, which matches the pattern `abs (data[i] - avg_filter[i - 1])` already used by `detect_peaks_z_score` a hundred lines further down in the same file, and stores the running maximum as a `double`. The behavior for signals that were already handled correctly is unchanged.

I built the project on macOS arm64 with `cmake .. && make -j8` and ran the reproduction through the Python binding against the freshly built `libDataHandler`. Before the change a flat line at +100 uV returned 100.0 while a flat line at -100 uV returned 0.0533, a rising ramp from 100 uV to 5000 uV returned 100.0, and uniform noise bounded by 0.9 uV returned exactly 0.0. After the change both flat lines return 100.0, the ramp returns 2.6667 in both signs, and the noise case returns 0.00047889, which matches `max (abs (data)) / max_val * 100` computed independently in NumPy. Signals at the actual rail and a flat line at zero still return 100.0, and uniform noise bounded by 90000 uV returns 47.989 which again matches the closed form.

There is no existing test that touches `get_railed_percentage`, so I could not extend one. As a regression check I ran the synthetic board signal processing examples that CI already runs, `denoising.py`, `signal_filtering.py`, `transforms.py`, `downsampling.py`, `band_power.py` and `windowing.py`, and all six pass. `clang-format` with the repository `.clang-format` reports no change in the edited region.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aa04915bd086`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.