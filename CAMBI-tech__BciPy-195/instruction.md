# Issue

**Title:** Updates to integration tests to reflect recent changes

## Description

# Overview

Updated offline analysis integration tests to reflect recent updates to codebase. Removed defaults in critical parameter lookups  in offline analysis.

## Ticket

https://www.pivotaltracker.com/story/show/181039129

## Contributions

- `signal/tests/model/integration_test_input/` - updates triggers.txt and parameters.json
- `signal/model/offline_analysis.py`: remove defaults for critical parameters (those that would change AUC) and require them to be passed in with parameters. 

## Test

- `make test-all`
- `make integration-test`

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? None that I know of....

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `be5b4e8af230`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.