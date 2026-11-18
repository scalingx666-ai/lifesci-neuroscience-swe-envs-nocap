# Issue

**Title:** Log default name assignment at INFO instead of WARNING level

## Description

## Description

**What is this PR**
- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
Default value assignments for parameters such as `individual_names` and `keypoint_names` were previously logged at `WARNING` level. This caused unnecessary noise during normal use and especially during CI test runs, since assigning a default is not a misconfiguration — it is expected behaviour.

**What does this PR do?**
Downgrades the relevant `logger.warning(...)` calls to `logger.info(...)` for messages that are purely about default value assignment. Genuine misconfiguration warnings (where the user needs to take action) are left unchanged at `WARNING` level. Tests that previously asserted `WARNING` level for these messages have been updated to assert `INFO` level accordingly.

## References
- 
- Originally raised in #705 (comment) by @niksirbi
- Related refactor: #706

## How has this PR been tested?
- Existing tests updated to reflect the new `INFO` log level for default-assignment messages
- Full test suite run locally with `pytest -q` — all tests pass
- Pre-commit hooks run with `pre-commit run --all-files` — all clean
- Ruff lint and format checks pass with zero errors
- Docs built locally with `make -C docs html` — zero Sphinx warnings
- Docs linkcheck run with `make -C docs linkcheck` — zero broken links

## Is this a breaking change?
No. This only changes the log level of specific informational messages from `WARNING` to `INFO`. No public API, data structures, or behaviour is affected. Users who have configured their logger to show only `WARNING` and above will simply no longer see these default-assignment messages, which is the intended outcome.

## Does this PR require an update to the documentation?
No documentation update is required. The change is internal to the logging behaviour and does not affect any public-facing API or user guide.

## Checklist:
- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cbb4f5ec7edf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.