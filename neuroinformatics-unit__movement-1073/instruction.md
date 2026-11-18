# Issue

**Title:** Migrate tox INI to TOML

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
 

**What does this PR do?**
This PR is a  and is branched off it:

- replaces the deprecated tox INI format in pyproject.toml with TOML
- removes the `isolated_build` key dropped in tox v4; [isolated builds are always used](https://tox.wiki/en/4.23.1/upgrading.html#removed-tox-ini-keys)

## References
#1071 #1072 

## How has this PR been tested?
Tests continue to run on CI

## Checklist:

- [ ] Rebase against main when #1071 is merged
- [ ] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `465e1740f329`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.