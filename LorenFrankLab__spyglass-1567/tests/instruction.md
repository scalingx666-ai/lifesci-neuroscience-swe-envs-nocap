# Issue

**Title:** fix: _get_epoch_groups raises TypeError for SpatialSeries with starting_time+rate

## Description

# Description

- `src/spyglass/utils/nwb_helper_fn.py`: Guard `timestamps[0]` access with `is not None` check; fall back to `spatial_series.starting_time` directly for rate-based series (where `timestamps` is `None`).
- `tests/utils/test_nwb_helper_fn.py`: Add `test_get_epoch_groups_with_timestamps` and `test_get_epoch_groups_with_rate` to cover both timing conventions.
- `CHANGELOG.md`: Add entry for this fix under Infrastructure.

```python
# Previously raised TypeError
spatial_series = pynwb.behavior.SpatialSeries(
    name="series_0",
    data=np.zeros((100, 2)),
    starting_time=0.0,
    rate=30.0,           # timestamps is None
    reference_frame="unknown",
)
position = pynwb.behavior.Position(spatial_series=spatial_series)
epoch_groups = _get_epoch_groups(position)  # now works correctly
```

# Checklist:

- [X] N/A. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/A. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/A. If this PR makes changes to position, I ran the relevant tests locally.
- [X] N/A. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [X] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8a4b56c1c53a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.