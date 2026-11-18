# Issue

**Title:** Fix COLA for odd sizes

## Description

One thing that tripped up @nordme recently, COLA should work regardless of step size, sample rate, etc. Hann doesn't satisfy the COLA constraint for odd window sizes, so make the necessary (tiny) adjustment to the window using `scipy.signal.closest_STFT_dual_window` to get a COLA-satisfying window in those cases:

```
>>> import numpy as np
>>> import scipy.signal
>>> import matplotlib.pyplot as plt
>>> win = np.hanning(101)
>>> win_2, _ = scipy.signal.closest_STFT_dual_window(np.ones(101), 51, win, scaled=False)
>>> plt.plot(win)
[<matplotlib.lines.Line2D object at 0x72acd0de5160>]
>>> plt.plot(win_2)
[<matplotlib.lines.Line2D object at 0x72acd0ad5a90>]
```

<img width="662" height="579" alt="Screenshot From 2026-09-15 12-08-13" src="https://github.com/user-attachments/assets/d6b6552e-0474-484e-a249-1a81aa84cd5c" />

Log if that adjustment was made. For SciPy older than 1.16, continue raising an error. Fix a tiny bug in our step calculation for odd windows, too. Adjust a couple of existing tests that would fail on `main` but pass on this PR. Changes drafted by Claude Opus 5 and iterated on and reviewed by me.

This one is a pretty straightforward bugfix so I'll self-mark for merge-when-green, but if someone wants to review and sees issues I'm happy to address them in a follow-up PR!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d07ed22e2313`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.