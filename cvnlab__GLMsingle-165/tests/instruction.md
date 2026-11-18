# Issue

**Title:** Fixing maxploydeg parameter initialization in python version

## Description

## Description

The Python code responsible for initializing the maxpolydeg parameter in params contains a bug. Instead of assigning a flat array (similar to the MATLAB implementation), the code produces a list of arrays, which may not match the expected structure for maxpolydeg.
```python
if 'maxpolydeg' not in params:
    params['maxpolydeg'] = [
        np.arange(
            alt_round(
                ((self.data[r].shape[-1]*tr)/60)/2) + 1
            ) for r in np.arange(numruns)]
```

## Problem

The use of `np.arange` generates a sequence for each run, resulting in params['maxpolydeg'] being a list of arrays, not a single array of polynomial degrees. 

The current fix ensures that the Python version generates equivalent maximum polynomial degrees to those produced by the MATLAB version.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b6453fa12708`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.