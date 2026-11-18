# Issue

**Title:** Centralise load registry and refactor `infer_source_software`

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
Currently we keep 3 "registries"/mappings in separate dicts: 
- source software &rarr; loader function
- source software &rarr; validators
- suffix &rarr; validator

#1056 centralises these in a single writer registry. Here we replicate the idea for the loader registry (also for consistency).

**What does this PR do?**
This PR 
- reduces the loader registries to a single one (source of truth); loader registry now stores a mapping of source software &rarr; _LoaderEntry (which encapsulates the `loader` function and the `suffix_validator_map`). This in turn simplifies `infer_source_software` and `get_supported_source_software`
- refactors `infer_source_software` by
  - disabling movement logger only once per function call, rather than per source software in the for loop
  - adding a fast exit path by skipping validation call when the file suffix is not within the suffix map

## References
#1056 

## How has this PR been tested?
Tests have been updated as needed

## Is this a breaking change?
No. low-level changes only.

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `588db617e8a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.