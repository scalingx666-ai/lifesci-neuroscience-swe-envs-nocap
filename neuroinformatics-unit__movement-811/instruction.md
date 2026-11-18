# Issue

**Title:** Unpin sphinx and pin ablog>=0.11.13

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other: dependencies.

**Why is this PR needed?**

`ablog` is now compatible with Sphinx  v9, meaning we can update our pins in 'docs' dependencies.
See  and  for a full explanation.

**What does this PR do?**

Unpins sphinx and instead constrains `ablog` to versions equal or above v0.11.13.

## References




## How has this PR been tested?

Local documentation build in a fresh `uv venv`.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

N/A

## Checklist:

- [x] The code has been tested locally
- ~[ ] Tests have been added to cover all new functionality~
- ~[ ] The documentation has been updated to reflect any changes~
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f741080769bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.