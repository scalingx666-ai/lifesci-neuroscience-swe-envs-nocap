# Issue

**Title:** Make BIDSPath hashable

## Description

As part of optimizing MNE-BIDS-Pipeline, I'd like to make BIDSPath objects hashable so they can be used with `@functools.cache`, for example:
```
@functools.cache
def _find_matching_sidecar(
    bp: BIDSPath,
    ...
):
    return bp.find_matching_sidecar(...)
```
This isn't 100% correct but gets the idea across. Need to double check Python `__hash__` reqs, add class name hash, tests, etc. but wanted to get the ball rolling at least.

cc @dnacombo in case this might help you as well

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c30986ad044f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.