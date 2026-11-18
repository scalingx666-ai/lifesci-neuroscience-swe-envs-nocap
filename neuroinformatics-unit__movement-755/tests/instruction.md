# Issue

**Title:** Change default value assignment logs from WARNING to INFO

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [x] Other

This is a logging improvement/refactoring.

**Why is this PR needed?**

Default value assignment messages in [ValidPosesDataset](cci:2://file:///d:/Agentic_AI/Gssoc_NLU/movement/movement/validators/datasets.py:79:0-232:13) and [ValidBboxesDataset](cci:2://file:///d:/Agentic_AI/Gssoc_NLU/movement/movement/validators/datasets.py:235:0-428:13) currently log at WARNING level. However, assigning defaults to optional parameters is expected behavior, not an indication of a problem. Using WARNING level creates unnecessary noise in CI/CD logs and may alarm users who intentionally omitted optional parameters.

According to Python's logging guidelines:
- **INFO**: "Confirmation that things are working as expected"
- **WARNING**: "An indication that something unexpected happened"

**What does this PR do?**

- Changes 6 `logger.warning()` calls to `logger.info()` in [movement/validators/datasets.py](cci:7://file:///d:/Agentic_AI/Gssoc_NLU/movement/movement/validators/datasets.py:0:0-0:0)
- Updates [CONTRIBUTING.md](cci:7://file:///d:/Agentic_AI/Gssoc_NLU/movement/CONTRIBUTING.md:0:0-0:0) logging guidelines to reflect the new behavior
- Adds 2 new tests to verify INFO-level logging

## References

N/A

## How has this PR been tested?

- Added [test_poses_default_assignment_logs_at_info_level](cci:1://file:///d:/Agentic_AI/Gssoc_NLU/movement/tests/test_unit/test_validators/test_datasets_validators.py:416:0-448:73) test
- Added [test_bboxes_default_assignment_logs_at_info_level](cci:1://file:///d:/Agentic_AI/Gssoc_NLU/movement/tests/test_unit/test_validators/test_datasets_validators.py:451:0-483:73) test
- Both tests verify that default assignment messages log at INFO level (not WARNING)

## Is this a breaking change?

No. This only changes log verbosity. The messages still appear in log files (DEBUG level and above). They no longer appear in stderr (which logs at WARNING level by default).

## Does this PR require an update to the documentation?

Yes. [CONTRIBUTING.md](cci:7://file:///d:/Agentic_AI/Gssoc_NLU/movement/CONTRIBUTING.md:0:0-0:0) has been updated to reflect that `logger.info()` should be used for default value assignments instead of `logger.warning()`.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `887bd023947c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.