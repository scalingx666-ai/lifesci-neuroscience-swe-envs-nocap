# Issue

**Title:** Fix coordinate assignment for `elem2` in `_cdist`

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

The `_cdist` function in `movement/kinematics/distances.py` had a semantic bug where it incorrectly assigned coordinates for the second element (`elem2`) in pairwise distance calculations. The function was using coordinates from array `a` for both `elem1` and `elem2`, when `elem2` should correctly use coordinates from array `b`.

While this bug may not cause functional issues in typical use cases (where both arrays come from the same dataset and have identical coordinates after xarray alignment), it represents a code correctness issue that should be fixed for:
- Semantic correctness
- Code maintainability
- Future-proofing against edge cases
- Clarity of intent

**What does this PR do?**

This PR fixes the coordinate assignment bug in `_cdist` by changing line 102 from:
```python
elem2: getattr(a, labels_dim).values,  # Incorrect
```
to:
```python
elem2: getattr(b, labels_dim).values,  # Correct
```

This ensures that the `elem2` dimension is correctly assigned coordinates from array `b`'s `labels_dim`, matching the semantic intent of the function where `elem1` comes from `a` and `elem2` comes from `b`.

## References

- Fixes issue #775
- Related to the bug analysis that identified incorrect coordinate assignment in `_cdist` function

## How has this PR been tested?

1. **Existing tests pass**: All existing unit tests for `_cdist` continue to pass, confirming that the fix doesn't break existing functionality:
   ```bash
   pytest tests/test_unit/test_kinematics/test_distances.py::test_cdist_with_known_values -v
   ```
   Both test cases (`individuals` and `keypoints` dimensions) pass successfully.


## Is this a breaking change?

No

## Does this PR require an update to the documentation?

No...

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (existing tests cover this functionality)
- [ ] The documentation has been updated to reflect any changes (no documentation changes needed)
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/) (no formatting issues, linting passes)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3a002c9032ca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.