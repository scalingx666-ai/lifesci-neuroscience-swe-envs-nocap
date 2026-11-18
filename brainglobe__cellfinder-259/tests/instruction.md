# Issue

**Title:** Replace `pandas.df.append` with `safe_concat`

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Newer versions of `pandas` break the analysis code, due to the deprecation and removal of `pandas.Dataframe.append`.

**What does this PR do?**
* Replaces the use of `pandas.Dataframe.append` with `brainglobe_utils.pandas.safe_concat` in `analyse.get_region_totals()`
* Adds a regression test to check that the result is still the same as with `pandas` 1.5.3, ie before deprecation).

## References

 

## How has this PR been tested?
* Regression data generated with `pandas 1.5.3` and test written.

## Is this a breaking change?

Nope

## Does this PR require an update to the documentation?

Nope

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e3301cde7b6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.