# Issue

**Title:** Authenticate with GitHub token during linkcheck

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other: speed up CI

**Why is this PR needed?**

We have lots of links to GitHub, and we want to avoid being rate-limited during linkcheck runs in CI (which manifests as "rate limited - sleeping..." ins linkcheck jobs).

**What does this PR do?**
Passes a GitHub token to the build_sphinx_docs action (feature added in ) and configures linkcheck to authenticate with GitHub.

## References

- Uses 
- Tested in 

## How has this PR been tested?



## Is this a breaking change?

No. The only expected change is an occasional speedup of the `build_sphinx_docs` action.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [ ] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `43457ac82ab0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.