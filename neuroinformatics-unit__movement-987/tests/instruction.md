# Issue

**Title:** Dropped `start`/`stop` `kwargs` from `compute_path_length` and `compute_path_straightness`

## Description

## Description

Remove `start`/`stop` `kwargs` from `compute_path_length` and `compute_path_straightness`. Users do the time-windowing with idiomatic xarray instead:

```python
compute_path_length(position.sel(time=slice(start, stop)))
```

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
- Refactoring will help reduce signature bloat.
- Unblocks downstream trajectory complexity metric work (#904, #905, #906, #907).

## References

Discussion on [Zulip](https://neuroinformatics.zulipchat.com/#narrow/channel/406001-Movement/topic/Potential.20trajectory.20complexity.20metrics/with/596086917)

## Is this a breaking change?

Yes, it would be included in the new release!

## Does this PR require an update to the documentation?

Yes, function docstrings updated to remove start/stop references; Examples now show the .sel() migration pattern.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d17ced06d819`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.