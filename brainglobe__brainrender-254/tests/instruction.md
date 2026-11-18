# Issue

**Title:** minor installation/test running fixing

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

- I managed to remove a `pyside2` dev dependency in the `mega-fix` branch, which was needed
- we should stop supporting py3.8 and test on py3.11 to follow NEP 29
- CI currently fails fast, so it's hard to get an overview of how tests are faring across OSs and Python version

**What does this PR do?**

- adds `pyside2` to dependencies
- drops support for Python 3.8.
- ensures all CI workflows are run even if one fails by setting `strategy.fail-fast = false`

## References

 
 

## How has this PR been tested?

Tests fail due to other reasons that lack of Qt back [in CI run](https://github.com/brainglobe/brainrender/actions/runs/6652661314)

## Is this a breaking change?

Nope

## Does this PR require an update to the documentation?

Not really, but see  for docs changes/improvements needed as part of megafix

## Checklist:

- [n/a] The code has been tested locally
- [n/a] Tests have been added to cover all new functionality (unit & integration)
- [n/a] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ee9b1fa95bb3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.