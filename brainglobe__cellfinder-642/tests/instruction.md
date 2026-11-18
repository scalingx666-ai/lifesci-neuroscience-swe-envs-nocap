# Issue

**Title:** Use headless-gui action on scheduled run with napari main too

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Our weekly scheduled test run failed on `napari` main after recently
 switching to our `uv` test action: https://github.com/brainglobe/cellfinder/actions/runs/29231831010

**What does this PR do?**

* ensures headless GUI action is used on scheduled tests with `napari` main
* ensure tests on `napari` main can be triggered manually

cc @AlgoFoe would be good to add these changes to your script, for the repos that depend on `napari`.

## References

Please reference any existing issues/PRs that relate to this PR.

## How has this PR been tested?

The changes seem to make the tests on `napari` main pass (tested via the introduced workflow dispatch trigger: see https://github.com/brainglobe/cellfinder/actions/runs/29250541723/job/86817783805

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [ n/a] The code has been tested locally
- [ n/a] Tests have been added to cover all new functionality (unit & integration)
- [ n/a] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `22f96a4eec47`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.