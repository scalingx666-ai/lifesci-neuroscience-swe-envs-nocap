# Issue

**Title:** Raise explicit error on uint16 label overflow in connect_four

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
- When using ```connect_four``` with ```uint16``` inputs, the number of disconnected structures can exceed the maximum representable label value, causing silent integer wraparound and incorrect structure labelling.

**What does this PR do?**
- It adds an explicit overflow check in ```connect_four``` to raise a clear error when the number of connected components exceeds the uint16 label capacity.

## References
- Fixes : #565 

## How has this PR been tested?
- Existing unit tests were updated to explicitly assert failure for overflowing ```uint16``` inputs.

## Is this a breaking change?
- No.

## Does this PR require an update to the documentation?
- No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ebbd0372e94`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.