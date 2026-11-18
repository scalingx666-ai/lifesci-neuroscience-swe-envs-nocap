# Issue

**Title:** Show "Done" only after training data is actually saved.

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

In the napari curation widget, clicking "Save training data" showed a "Done" popup immediately, before any cubes had been written to disk. The output folder appeared empty, so users assumed the export had finished and could delete the folder mid-write, causing errors. The async (non-blocking) save path launched the cube-extraction `thread_worker` and then synchronously wrote `training.yaml` and showed "Done", without waiting for the worker to finish.

**What does this PR do?**

It moves the YAML write, the "Done" notification, and the status-label reset into a single `__finish_save` helper, invoked synchronously for the `block=True` path and from the worker's `returned` signal for the async path, so "Done" appears only after all cubes are saved.

## References

.

## How has this PR been tested?

Added a regression test `test_async_save_done_only_after_cubes_written` in `tests/napari/test_curation.py` that drives the async path and asserts no files exist and "Done" has not been shown immediately after the call returns, then waits for the worker (`qtbot.waitUntil`) and confirms "Done" fires exactly once with two cell and two non-cell cubes written. 

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98c0daa96469`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.