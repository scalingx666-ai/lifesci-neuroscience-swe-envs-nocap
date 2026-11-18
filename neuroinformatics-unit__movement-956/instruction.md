# Issue

**Title:** Migrate `dev` and `docs` from optional dependencies to PEP 735 dependency groups

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
 

**What does this PR do?**
- moves `docs` and `dev` dependencies from "optional dependencies" (extras) to "dependency groups"
- updates pip install instructions to use `--group`
- ~~temporarily uses `build_sphinx_docs@build-docs-group-dep`~~ (from )

## References


## How has this PR been tested?
- build docs@main [fails](https://github.com/neuroinformatics-unit/movement/actions/runs/24256424665/job/70829024250?pr=956) 
- build docs@build-docs-group-dep [passes](https://github.com/neuroinformatics-unit/movement/actions/runs/24355193043/job/71120187411?pr=956)

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42d99a3a65f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.