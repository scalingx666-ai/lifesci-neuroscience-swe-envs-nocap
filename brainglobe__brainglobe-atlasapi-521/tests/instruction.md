# Issue

**Title:** minor bug fix utils.retrieve_over_http

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
While adding a test for `utils.retrieve_over_http` (see ) I noticed that when there is a connection error and no file in the specified `output_file_path` exists, the block of code below errors at `output_file_path.unlink()`, throwing an `FileNotFoundError`, instead of raising the `ConnectionError `(which is I think what is desired in this case).
```
    except requests.exceptions.ConnectionError:
        output_file_path.unlink()
        raise requests.exceptions.ConnectionError(
            f"Could not download file from {url}"
        )
```      
**What does this PR do?**
sets `output_file_path.unlink(missing_ok=True)` so that the correct error message is shown in case of an `ConnectionError`.

## References
#518

## How has this PR been tested?
Added `test_retrieve_over_http_ConnectionError` to `test_utils.py` with `XFAIL` marker that can be removed after this PR is merged.

## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9362d2d88981`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.