# Issue

**Title:** Migrate data repository to SWC GIN

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
CI is often failing because movement sample datasets are currently hosted on [G-Node GIN](https://gin.g-node.org/neuroinformatics/movement-test-data), which is frequently down.
We have now migrated the data repository to [SWC GIN](https://gin.swc.ucl.ac.uk/neuroinformatics/movement-sample-data).

**What does this PR do?**
This PR replaces URLs pointing to movement's data repository on G-Node to SWC's instance.

## How has this PR been tested?
Tests retrieve the sample data from the data repository. If all tests pass, this indicates the data is fully migrated and available.

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
Docs mentioning the gnode data repository have been updated but the exact instructions to upload using the GIN CLI may not work now since CLI access is restricted within the institute's network.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae9a240f2a9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.