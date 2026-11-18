# Issue

**Title:** Pad `phase_shift` and `gaussian_filter` FFTs to a fast length

## Description

`phase_shift` and `gaussian_filter` take an FFT of each chunk plus its margins. Most such lengths have a large prime factor, which makes the FFT up to three times slower.

For example, a 1 s chunk through `phase_shift` is 30,000 samples, plus 40 ms of margin on each side (32,400), plus whatever margin the next step asks for. Of the 301 lengths that margins of 0 to 300 samples give, only 3 have no prime factor above 7.

This PR pads each FFT to `scipy.fft.next_fast_len` and crops the result.

**Speed.** One thread, 384 channels, i9-12900K:

<img width="1350" height="480" alt="fft_length" src="https://github.com/user-attachments/assets/113f530d-bc74-4296-af36-2f94fad5fbeb" />

*Time per 1 s chunk at each length. On main most lengths are slow; with this PR they all take about the same time.*

| | lengths | main, median / worst | this PR, median / worst |
|---|---|---|---|
| `apply_frequency_shift`, float32 | 1 s chunk + margins of 0–300 | 467 / 662 ms | 200 / 212 ms |
| `gaussian_filter`, int16 | every third length, 30,000–30,300 | 774 / 875 ms | 499 / 520 ms |

Per length, `apply_frequency_shift` is 2.3 times faster (median) and up to 3.2 times; `gaussian_filter` is 1.6 times faster and up to 1.8 times. A few lengths get slower: 5 of 301 by 5–14% for `apply_frequency_shift`, and 1 of 101 by 15% for `gaussian_filter`.

**Output.** Lengths that were already fast give the same output. Otherwise:

- `phase_shift` moves by at most 0.022 int16 counts, against a signal rms of 51, because the padding changes the period of the circular shift.
- `gaussian_filter` gives identical int16 output, and float32 output within 3e-5 counts, because the padding lies beyond the margin.

The existing tests pass unchanged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd5d42312420`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.