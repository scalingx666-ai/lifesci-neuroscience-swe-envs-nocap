# Issue

**Title:** Fix MultiIndex error in compute_forward_displacement

## Description

Replace `reindex(data.coords)` with `reindex_like(data)` to avoid a RuntimeError when `DataArray` coordinates originate from pandas `MultiIndex` levels that carry the `_no_setting_name` flag.

- Fix `_compute_forward_displacement` (line 129)
- Fix `compute_displacement` (line 115, deprecated)
- Add regression test `test_forward_displacement_with_multiindex_coords`

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/neuroinformatics-unit/.github/blob/main/CONTRIBUTING.md).

---

## Description

### What is this PR

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

### Why is this PR needed?

When `compute_forward_displacement` is called with an xarray `DataArray` created from a pandas `MultiIndex` (via `to_xarray()`), the current implementation fails with a `RuntimeError`.  
This happens because `reindex(data.coords)` internally attempts to rename index levels, which pandas explicitly disallows for `MultiIndex` objects with the `_no_setting_name` flag.

As a result, valid inputs can unexpectedly fail even though the underlying data is correct.

### What does this PR do?

This PR replaces the use of `reindex(data.coords, fill_value=0)` with `reindex_like(data, fill_value=0)` in both the active and deprecated code paths.

`reindex_like()` provides the same alignment and fill behavior while avoiding index-level name mutation, making the function safe for MultiIndex-backed inputs. A regression test has also been added to ensure this case remains supported going forward.

---

## References

- 

---

## How has this PR been tested?

- Added a regression test (`test_forward_displacement_with_multiindex_coords`) based on the reproducible example provided in the issue
- Verified that the test fails on the current main branch and passes with this change
- Ran the full test suite locally to ensure no existing behavior is affected

---

## Is this a breaking change?

No. This change preserves existing behavior and only affects internal reindexing logic to improve robustness for specific input types.

---

## Does this PR require an update to the documentation?

No. This is an internal bug fix and does not change the public API or user-facing behavior.

---

## Checklist

- [x] The code has been tested locally
- [x] Tests have been added to cover the reported issue
- [ ] The documentation has been updated to reflect any changes (not required)
- [x] The code has been formatted with pre-commit

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ddec403d5eed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.