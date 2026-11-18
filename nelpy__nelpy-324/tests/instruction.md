# Issue

**Title:** make _analogsignalarray nan aware

## Description

Switched RSASA max to NaN-aware reduction in _analogsignalarray.py:1956 by using np.nanmax. 

Switched RSASA min to NaN-aware reduction in _analogsignalarray.py:1980 by using np.nanmin. 

Added regression test test_AnalogSignalArray.py:311 in test_AnalogSignalArray.py to verify mean/std/min/max all match NumPy NaN-aware behavior on NaN-containing data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42b6216edeef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.