# Issue

**Title:** bug fixes atlasgen/mesh_utils

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Found two small bugs while working on PR #556, .

See following points in #541
- [x] 8. `smooth `bug in `extract_mesh_from_mask` . smooth parameter gets reasigned in some circumstances, leading to a ValueError (see below).
- [x] 9. `extractLargestRegion` should be `extract_largest_region` in `extract_mesh_from_mask` 

8. error caused by smooth bug
```
  if smooth:
        mesh.smooth()

```
> E       ValueError: The truth value of an array with more than one element is ambiguous. Use a.any() or a.all()



9. error caused by extractLargestRegion

> ```
> >           mesh = mesh.extractLargestRegion()
> E           AttributeError: 'Mesh' object has no attribute 'extractLargestRegion'
> 
> brainglobe_atlasapi\atlas_generation\mesh_utils.py:157: AttributeError
> ```

**What does this PR do?**
fixes both bugs 
8. renaming `smooth` to `smooth_array` so that `smooth `parameter is not overwritten
10. `extractLargestRegion `-> `extract_largest_region`

## References
#541 points 8 and 9

## How has this PR been tested?
#556  (remove xfail markers)

## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `22dcddc5a22e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.