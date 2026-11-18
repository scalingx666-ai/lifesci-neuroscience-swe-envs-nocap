# Issue

**Title:** Support single z-stack tif file for input

## Description

## Description

This is part of these other two PRs:  and 


**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Without this, the pipeline can only read a folder of tiff files rather than a single tiff z-stack.

However, our computer has enough ram such that it is not a problem to load the full file to memory, so it'd be more efficient to do that. But without these changes I need to extract the stack to a sequence of tiff files.

**What does this PR do?**

Enables it so that it can read the tiff stack.

## How has this PR been tested?

I used it with the pipeline to read our single file tiff stack.

## Is this a breaking change?

Nope

## Does this PR require an update to the documentation?

I'm not sure. I updated the function docs.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)


Testing resulted in the following. I don't see anything here indicating it's because of my changes.

```
========================================================================================================== short test summary info =========================================================================================================== FAILED tests/core/test_integration/test_detection.py::test_detection_full[No free CPUs] - OSError: Unable to synchronously open file (truncated file: eof = 66060288, sblock->base_addr = 0, stored_eof = 184831728)
FAILED tests/core/test_integration/test_detection.py::test_detection_full[One CPU] - OSError: Unable to synchronously open file (truncated file: eof = 66060288, sblock->base_addr = 0, stored_eof = 184831728)
FAILED tests/core/test_integration/test_detection.py::test_callbacks - OSError: Unable to synchronously open file (truncated file: eof = 66060288, sblock->base_addr = 0, stored_eof = 184831728)
FAILED tests/core/test_integration/test_detection.py::test_synthetic_data - OSError: Unable to synchronously open file (truncated file: eof = 66060288, sblock->base_addr = 0, stored_eof = 184831728)
FAILED tests/core/test_integration/test_detection_structure_splitting.py::test_structure_splitting - OSError: Unable to synchronously open file (truncated file: eof = 66060288, sblock->base_addr = 0, stored_eof = 184831728)
====================================================================================== 5 failed, 94 passed, 2 xfailed, 6 warnings in 335.87s (0:05:35) ==========================================================
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `560909ff6eb7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.