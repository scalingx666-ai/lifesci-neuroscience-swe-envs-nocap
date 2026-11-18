# Issue

**Title:** Map individual-wise confidence scores to SLEAP instance_scores

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
 

**What does this PR do?**
This PR 
- adds support for falling back to `instance_scores` from SLEAP `.h5` analysis formats as individual-wise confidence scores when `point_scores` are not available (all NaNs or when the "point_scores" key doesn't exist in SLEAP .h5 file) when _loading_ from SLEAP .h5 files
- does _not_ modify the behaviour of loading from `.slp` formats because we expect and read scores from `PredictedInstance` using [`.numpy(scores=True)`](https://github.com/talmolab/sleap-io/blob/80bbcd9c3b005a7616c14b875b761071f10ecde6/sleap_io/model/instance.py#L1362-L1365).
- stores individual-wise confidence score as `instance_scores` when _saving_ to SLEAP `.h5` formats; the behaviour for storing keypoint-wise confidence (as `point_scores`) remains unchanged

## References
#1003 #1074

## How has this PR been tested?
New tests have been added

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
Docstrings are updated accordingly

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `11f9a175dee9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.