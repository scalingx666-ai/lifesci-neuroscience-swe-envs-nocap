# Issue

**Title:** Fix errors in conda install check workflow

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

This is a patch for #701.
Embarrassingly, I hade spelled the command as `movement --info` instead of the correct `movement info`.

**What does this PR do?**

- Corrects the `movement` CLI command.
- Explicitly removes the conda "defaults" channel to [get rid of warnings](https://github.com/neuroinformatics-unit/movement/actions/runs/19277343590).

## References

#701

## How has this PR been tested?

See [previous failed CI run here](https://github.com/neuroinformatics-unit/movement/actions/runs/19277343590).

I will manually re-run this workflow after this is merge to main.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c096adae558e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.