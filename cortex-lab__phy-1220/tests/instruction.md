# Issue

**Title:** Replace `np.in1d` which will be deprecated

## Description

@rossant 

Just an FYI that `np.in1d` will be deprecated with the next version of NumPy and I assume will eventually be a hard error. This just updates calls to `np.in1d` to `np.isin`, which is the the NumPy standard. I also opened a PR in `phylib` to do the same.

I also scanned both repos for some other hard errors coming like `float_` `NaN` and `Inf` which are aliases which will be dropped in the next version of NumPy (recs are to use `float64` `nan` and `inf`, which both repos already use where necessary).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `642c875994b4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.