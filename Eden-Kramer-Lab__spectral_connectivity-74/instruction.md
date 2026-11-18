# Issue

**Title:** Fix n_fft_samples docstring: uses next_fast_len, not next power of 2

## Description

The `Multitaper` class docstring incorrectly stated that `n_fft_samples` defaults to "next power of 2 >= n_time_samples_per_window". The implementation actually uses `scipy.fft.next_fast_len()` (or `cupy.fft.next_fast_len()` for GPU), which returns an FFT-efficient length that may not be a power of 2.

For example:
```python
from scipy.fft import next_fast_len
next_fast_len(30000)  # Returns 30000, not 32768
next_fast_len(100)    # Returns 100, not 128
```

## Changes

- Updated `n_fft_samples` parameter docstring in `Multitaper.__init__()` to accurately describe the behavior:
  - Removed incorrect "next power of 2" claim
  - Added reference to `scipy.fft.next_fast_len` / `cupy.fft.next_fast_len`
  - Clarified that the value is chosen for FFT efficiency, not strictly power-of-2 alignment

<!-- START COPILOT CODING AGENT SUFFIX -->

<details>

<summary>Original prompt</summary>

>
> ----
>
> *This section details on the original issue you should resolve*
>
> <issue_title>multitaper DocString incorrect</issue_title>
> <issue_description>the Multitaper constructor says:
> `n_fft_samples : int, optional
>     Length of FFT. If None, uses next power of 2 >= n_time_samples_per_window.`
>
> But e.g. if the data length is 30000, it gives 30000. This is because cupy.fft.next_fast_len(30000)=30000. I'm not sure why it thinks that 30000 is a fast length. From its docstring: "note::
>         It may return a different value to :func:`scipy.fft.next_fast_len`
>         as pocketfft's prime factors are different from cuFFT's factors.
>         For details, see the `cuFFT documentation`_."
>
> Maybe we should change the docstring to say:
> `n_fft_samples : int, optional
>     Length of FFT. If None, uses a value >= n_time_samples_per window chosen to be fast for the FFT algorithm, cupy.fft.next_fast_len(n_time_samples_per_window).`</issue_description>
>
> ## Comments on the Issue (you are @copilot in this section)
>
> <comments>
> </comments>
>

</details>

- Fixes Eden-Kramer-Lab/spectral_connectivity#73

<!-- START COPILOT CODING AGENT TIPS -->
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f6a738de8fb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.