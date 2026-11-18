# Issue

**Title:** Add "See Also" to `load_multiview_dataset` docstring

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other: Doc fix

**Why is this PR needed?**

The `load_multiview_dataset` docstring mentions a "See Also" seciton, but no such section is present. This must have been overlooked in #722.

**What does this PR do?**

Adds the "See also" section (same as for `load_dataset`).

## References

Related to #722.

## How has this PR been tested?

Local docs build.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

It *is* an update of docs.

## Checklist:

- [x] The code has been tested locally
- ~[ ] Tests have been added to cover all new functionality~
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c7c72f4a1e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.