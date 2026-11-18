# Issue

**Title:** [FIX] schema - add events to extra suffixes

## Description

### All Submissions:

- [x] Have you followed the guidelines in our Contributing document?
- [x] Have you checked to ensure there aren't other open [Pull Requests](https://github.com/bids-standard/bids-matlab/pulls) for the same update/change?

<!-- You can erase any parts of this template not applicable to your Pull Request. -->

### New Feature Submissions:

1. [ ] Does your submission pass tests?
2. [x] Have you lint your code locally prior to submission?

### Changes to Core Features:

- [x] Have you added an explanation of what your changes do and why you'd like us to include them?
- [ ] Have you written new tests for your core changes, as applicable?
- [x] Have you successfully ran tests with your changes locally?

---

Content:

- events suffixes were 'moved' of their datatypes by 
- they need to be added back 'manually' when checking the list of suffixes for a given datatype

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47eb409b900a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.