# Issue

**Title:** Prevent `NaN` values in mean lifetimes and intervals

## Description

In some cases in which a state or mode has a zero activation, mean lifetimes and intervals can return `NaN` values.

This is because if there is no activation within a sliced time course, `modes.lifetimes()` will output an empty array, which later outputs 'NaN' when `np.mean` or `np.std` is applied.

Using `np.nanmean` (as initially suggested) does not work.
```
np.nanmean(np.array([]))
>> nan
```

Instead, the function `_apply_to_lists` was edited such that if a list is empty, 0 is returned. Therefore, any sliced time course with zero activation will have summary metric of 0.

With this change, lifetimes and intervals do not have `NaN` values anymore. If this change seems to be insufficient as an alternative, I'll revert the commit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0463b53204c1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.