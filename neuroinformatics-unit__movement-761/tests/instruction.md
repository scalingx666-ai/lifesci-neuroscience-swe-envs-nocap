# Issue

**Title:** Adapt `savgol_filter` for compatibility with Scipy >= 1.17

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**



**What does this PR do?**

- Removes Scipy upper pin
- Adapts `savgol_filter` behaviour for compatibility with Scipy >= 1.17

Quote adapted from 

> By examining the full error traceback and looking into the [SciPy 1.17 implementation of _savitzky_golay.py](https://github.com/scipy/scipy/blob/v1.17.0/scipy/signal/_savitzky_golay.py?rgh-link-date=2026-01-16T14%3A30%3A38.000Z), we see that the error happens only when 'mode=interp' (which is the default) and there are NaNs present at the edges. In other words, the problem is not the presence of NaNs in general but their presence at the edges, because this prevents SciPy from interpolating those edges.
> 
> Given that, I'implementing a different solution to specifically handle the case where edge windows contain NaNs:
>
> - Defaults to mode='nearest' instead of the default 'mode='interp' to avoid the ValueError
> - Raises an informative error if the user explicitly supplies mode='interp'
>
> In all other cases (no NaNs in edge window), the behaviour remains unchanged.

## References

 

## How has this PR been tested?

Added a new unit test to specifically check for the adapted behaviour.

## Is this a breaking change?

Not really. But depending on the datasets, users may now get `mode='nearest'` instead of `mode='interp'` when running the savgol filter.

## Does this PR require an update to the documentation?

A note has been added to the function's docstring.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b3f5a9c4afdb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.