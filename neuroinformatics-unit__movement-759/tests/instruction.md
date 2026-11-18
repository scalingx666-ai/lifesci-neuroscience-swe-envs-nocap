# Issue

**Title:** Add code snippets for verifying sample data loading

## Description

## Description

**What is this PR**
- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
Users need a quick way to verify that sample datasets can be fetched and loaded correctly. Currently, there's no documentation showing this workflow, which can leave users uncertain if their data loading is working properly.

**What does this PR do?**
Adds code snippets to the documentation demonstrating how to verify sample data loading:
1. Updates `fetch_dataset_paths()` docstring with a verification example
2. Adds a "Verifying sample data" subsection to the Adding Data documentation

## References


## How has this PR been tested?
- Verified that existing functionality remains unchanged (only documentation was modified)
- Built documentation locally to confirm proper rendering

## Is this a breaking change?
No. This PR only adds documentation and does not modify any existing code functionality.

## Does this PR require an update to the documentation?
This PR **is** a documentation update. No further documentation changes are needed.

## Checklist:
- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality *(N/A - documentation only)*
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f836e6675e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.