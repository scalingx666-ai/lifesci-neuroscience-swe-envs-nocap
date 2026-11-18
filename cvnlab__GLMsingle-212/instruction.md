# Issue

**Title:** port construct_stim_matrix verbatim from matlab

## Description

. supersedes #184.

the python helper `construct_stim_matrix` had two of the three matlab branches stubbed out, and the remaining branch used a negative slice end when the shift exceeded the vector length. in python that wraps instead of producing an empty range, which raised a `ValueError` in the run-wise FIR fit for any run shorter than the FIR window (~30 s / TR).

- implement wantwrap branch with `np.roll` (was dead code)
- implement negative-lag branch (was a `pass`)
- guard empty index ranges so out-of-range shifts leave zeros, matching matlab's silent no-op
- no behavior change for existing callers, which all pass `prenumlag=0, wantwrap=0`

verified by running `matlab/utilities/constructstimulusmatrices.m` in MATLAB R2022b over 492 input combinations (vector lengths 1 to 8, prenumlag and postnumlag 0 to 6, wantwrap on and off, the worked example from the matlab header, and the short-run repro below) and comparing against the python port: all 492 outputs match exactly. also confirmed an end-to-end `GLM_single.fit` with a 20-volume run completes.

minimal repro (raises on main, returns a 3x6 matrix here):
```python
from glmsingle.design.construct_stim_matrices import construct_stim_matrices
construct_stim_matrices([[0, 1, 0]], prenumlag=0, postnumlag=5)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1ab54a65edd3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.