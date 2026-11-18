# Issue

**Title:** minor bug fix utils.atlas_repr_from_name

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
While adding a test for `utils.atlas_repr_from_name` (see ) I discovered what I think is a minor bug.

`utils.atlas_repr_from_name` generates a dictionary with the atlas description given the atlas name but doesn't fetch the correct `major version` (it's always an empty string).

For example, `axolotl_1um_v5.3` results in
```
            {
                "name": "axolotl",
                "major_vers": "",
                "minor_vers": "3",
                "resolution": "1",
            }
```
While I think it should be
```
            {
                "name": "axolotl",
                "major_vers": "5",
                "minor_vers": "3",
                "resolution": "1",
            }
```

**What does this PR do?**
Changes the indexing to fetch `major_vers`.

## References
#518

## How has this PR been tested?
Added `test_atlas_repr_from_name` to `test_utils.py` with `XFAIL` marker that can be removed after this PR is merged.

## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9362d2d88981`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.