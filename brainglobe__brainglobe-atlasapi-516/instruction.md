# Issue

**Title:** update setuptools dependency

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other (update setuptools dependency)

**Why is this PR needed?**
`setuptools` [`v64`](https://setuptools.pypa.io/en/latest/history.html#v64-0-0) introduced editable installs, which is why this version it is often kept as a lower bound in python package dependencies. Not having the `v64` lower bound set often won't give problems since dependency resolvers will usually fetch the more recent versions, but it did in the case of @mxochicale who had an older version of setuptools installed (I believe `v62`).

**What does this PR do?**
Increase lowest `setuptools` version requirement in the `pyproject.toml` to `v64` when editable installs (PEP 660) are introduced.

## References
see comment in issue #510 

## How has this PR been tested?
I changed `setuptools>=45` in `pyproject.toml` to `setuptools==45`, `setuptools==63` and `setuptools==64` etc, and indeed the editable installations is only intstalled, from `v64` onwards.

## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
No.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `15811235c23e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.