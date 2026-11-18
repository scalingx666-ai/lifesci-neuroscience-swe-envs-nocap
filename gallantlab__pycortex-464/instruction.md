# Issue

**Title:** FIX avoid registering the same colormap twice to matplotlib

## Description

Pycortex raises an error with matplotlib 3.6, when it tries to register the same colormap twice. This is because the check `if self.cmap not in cm.__dict__` does not work anymore. (See recent changes to the colormaps API in matplotlib [here](https://matplotlib.org/3.6.0/api/prev_api_changes/api_changes_3.6.0.html#pending-deprecation-top-level-cmap-registration-and-access-functions-in-mpl-cm))

This PR:
- fixes how to check that the colormap is already registered
- refactors duplicated code into a new method `get_cmapdict` in `Dataview` and `DataviewRGB`
- add a test for clarity

I tested the fix with matplotlib 3.3 and 3.6.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `258cbf9cf192`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.