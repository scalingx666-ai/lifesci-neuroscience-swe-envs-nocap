# Issue

**Title:** Remove setup-miniconda action from test workflow

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] CI cleanup

**Why is this PR needed?**

The `setup-miniconda` action was added to our test workflow back in #133, because it was needed for `tox-conda` to work properly.

As of #683 , we no longer use `tox-conda`, so there should be no more need for this action in `test_and_deploy.yml`.

Besides, we now run conda install steps in a separate workflow,  and #703.

**What does this PR do?**

Remove the `setup-miniconda` actions from `test_and_deploy.yml`.

## References

#133
#683
#701
#703


## How has this PR been tested?

CI passes.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [ ] ~The code has been tested locally~
- [ ] ~Tests have been added to cover all new functionality~
- [ ] ~The documentation has been updated to reflect any changes~
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `21c246824091`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.