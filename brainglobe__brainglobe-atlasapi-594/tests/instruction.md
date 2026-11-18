# Issue

**Title:** [588]: Removing function that doesnt exist, passing resolution directly for now

## Description

## Description

Removing function that doesn't exist, passing resolution directly for now. 

Warning: This could cause issues if the resolution is passed in an incorrect order. This issue propagates to [brainglobe-registration](https://github.com/brainglobe/brainglobe-registration/blob/a799f834b68ac0c29e99cb6718e2f75a898be8e5/brainglobe_registration/registration_widget.py#L708-L722) now as well since the ASR resolution is out of order in the scaling.

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

It was calling a method that doesn't exist.

**What does this PR do?**

## References

#587 

## How has this PR been tested?

Run locally.

## Is this a breaking change?

It could? @alessandrofelder if you could confirm that there are no cases this would break, that'd be awesome.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `795bc029ae66`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.