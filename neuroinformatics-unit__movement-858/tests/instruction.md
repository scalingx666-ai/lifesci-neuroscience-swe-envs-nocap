# Issue

**Title:** List supported software in `load_dataset` error

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [x] Other (error-message UX improvement + test enhancement)

**Why is this PR needed?**

When an unsupported `source_software` is passed to `load_dataset`, the previous error did not clearly guide users to valid values. This made debugging harder, especially for new users.

**What does this PR do?**

- Improves the `ValueError` message in `load_dataset` to include:
  - the invalid `source_software` value
  - a sorted list of supported options from the loader registry
- Updates unit tests to verify:
  - the refined error text (`Unsupported source software`)
  - presence of `Supported options are:`
  - presence of known valid loader names in the message

## References

No linked issue for this PR.

## How has this PR been tested?

- Ran lint checks on changed files with:
  - `ruff check movement/io/load.py tests/test_unit/test_io/test_load.py`
- Verified behavior locally by triggering `load_dataset` with an unknown `source_software` and confirming the new message includes supported options.
- Updated existing unit test coverage in `tests/test_unit/test_io/test_load.py` for the new error-message behavior.

## Is this a breaking change?

No.  
This change is backward-compatible and only improves error messaging and related test assertions.

## Does this PR require an update to the documentation?

No.  
There is no API or usage change; only error clarity is improved.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29e75cfc95c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.