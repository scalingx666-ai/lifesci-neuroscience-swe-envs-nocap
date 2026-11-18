# Issue

**Title:** Simplifying NaN handling in compute_path_length

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other (behaviour change / simplification)

**Why is this PR needed?**

In the community call we agreed that path metrics should be "light touch": they should do only the geometric calculation their name implies and avoid hidden NaN preprocessing. The old default nan_policy="ffill" silently forward-filled gaps (which is not the same as linear interpolation), and the "scale" policy made a strong, invisible assumption that motion is statistically uniform across observed and missing frames. Both were confusing and surprising to users.

**What does this PR do?**

- compute_path_length and compute_path_straightness now default to nan_policy=None. This sums only the segments between consecutive valid positions (using xarray's native `skipna` with min_count=1) and does no gap-filling. A track is only NaN if all of its segments are missing.
- The "ffill" policy is kept as an explicit opt-in for users who want to treat gaps as stationary periods, with the docstring now clearly explaining what it does.
- The "scale" policy is removed. Passing it now raises a clear ValueError.
- Docstrings and tests are updated to match.

## References

. Related discussions: #957 and #1021.

## How has this PR been tested?

Updated the unit tests in ests/test_unit/test_kinematics/test_path.py:

- test_path_length_with_nan: replaced the "scale" case with a None (default) case and recomputed the expected values. For individual id_0 the default now gives [4*sqrt(2), 8*sqrt(2), NaN] across the three keypoints, versus `[9*sqrt(2), 8*sqrt(2), NaN]` for "ffill". The invalid policy case still checks the raised error.
- test_path_straightness_known_values: parametrized over `["ffill", None]` instead of `["ffill", "scale"]`.

I confirmed the new default drops the two segments on either side of each missing position, that `"ffill"` behaviour is unchanged, that passing "scale" raises ValueError, and that the NaN warning still fires.

## Is this a breaking change?

Yes. Two changes to be aware of:

- The default result changes for data that contains NaNs. The old default (ffill) crossed gaps in a straight line, so the new default returns a smaller path length across gaps. This is intentional: it is the honest geometric value with no assumptions. Users who want the old default can pass nan_policy="ffill".
- nan_policy="scale" is no longer accepted and raises ValueError. The old scale result can be reproduced manually as compute_path_length(data) / valid_segment_proportion, where valid_segment_proportion is the fraction of segments without a missing endpoint.

nan_policy="scale" is no longer accepted and now raises a `ValueError`. Users who relied on it can reproduce the old result in a few lines: compute the default (skip-missing) path length and scale it up by the fraction of valid segments.

```python
# Recover the old nan_policy="scale" result: take the default (skip-missing)
# path length and scale it up by the fraction of valid segments.
valid_segments = (data.diff("time").isel(time=slice(None, -1)).notnull().all("space"))
# Note: the final segment is dropped and we divide by (n_time - 1) to mirror
# how the old "scale" policy counted segments internally.
valid_proportion = valid_segments.sum("time") / (data.sizes["time"] - 1)
scaled_length = compute_path_length(data) / valid_proportion
```

## Does this PR require an update to the documentation?

The API reference is generated from docstrings, which have been updated. The nan_policy parameter and the Notes section now describe the new default and the "ffill" opt-in, and all "scale" text has been removed. No example or narrative doc needed changes: examples/compute_kinematics.py uses the default and its manual .sum() check now matches the None default more closely than it did with "ffill".

## Files changed

- movement/kinematics/path.py: new default logic in _path_length, updated signatures and docstrings for compute_path_length, compute_path_straightness, and _path_length.
- tests/test_unit/test_kinematics/test_path.py: updated NaN and straightness tests.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `15a1876b8656`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.