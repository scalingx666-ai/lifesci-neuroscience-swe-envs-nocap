# Issue

**Title:** Add `keep_points_with_nan_confidence` kwarg to `filter_by_confidence`

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

, see that issue for context on why this change is necessary and why it has become timely now.

Specifically, this PR implements the 'short-term' solution mentioned in that issue. The 'long-term' solution is described separately in #1027.

**What does this PR do?**

Adds a new optional keyword argument (kwarg) to the `filter_by_confidence` function:

```rst
  keep_points_with_nan_confidence
      Whether to keep data points whose confidence value is NaN.
      Default is ``True``. See notes for more information.
```

The `True` default means that points proof-read in SLEAP or `movement` (upcoming feature) will not be dropped during filtering. I think this default makes sense, since these are the points we should trust most.

I would like feedback on the name of the new kwarg. I went for long and explicit, but if you can think of an alternative, let me know.

## References

#1026
#1027

## How has this PR been tested?

I added a new test—`test_filter_by_confidence_on_proofread_data`—using an existing SLEAP fixture containing a fully proofread dataset (with nan confidences).

I also modified the existing `test_filter_by_confidence_on_position` test to introduce a single NaN confidence, so I can verify that point is not dropped by default.

All tests pass locally, with 100% coverage.

I also built the docs locally and inspected the API reference for `filter_by_confidence` and the examples in which the function was used.

## Is this a breaking change?

Yes! The default behaviour of `filter_by_confidence` is changed by this PR.

The older behaviour can be still recovered by setting `keep_points_with_nan_confidence=False`.

## Does this PR require an update to the documentation?

I added a new note to the docstring of `filter_by_confidence`.

The API reference has been updated automatically.

I examined whether any examples needed updating, but this was not the case, because no no example was applying `filter_by_confidence` to a dataset with NaN confidence values.

As far as I know the only such datasets among our sample data are `SLEAP_three-mice_Aeon_proofread.analysis.h5/.slp` (fully proofread, all confidence values are NaN) and `SLEAP_three-mice_Aeon_mixed-labels.analysis.h5/.slp` (partly edited, a few confidence values are NaN).

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `915792df792e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.