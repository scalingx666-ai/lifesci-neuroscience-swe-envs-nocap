# Issue

**Title:** Adding DMBA hierarchy

## Description

## Description

Updates the Duke Mouse Brain Atlas packaging to:

- Use mean diffusivity (MD) as the default reference template, with others available as an additional template;
- Include the DMBA/RCCF source hierarchy, replacing the previously flat structure tree;
- Preserve DMBA’s source terminology and region groupings.

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

**What does this PR do?**

## References


## How has this PR been tested?

This has been tested locally.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f1b2d61c5e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.