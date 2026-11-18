# Issue

**Title:** ensure trained_model is a Path before calling .suffix

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Latest `brainmapper` fails because of a missing attribute when you call it with `--trained_model`.

**What does this PR do?**

Converts `trained_model` to `Path` before calling `.suffix`

## References

 

## How has this PR been tested?

Local manual tests with `brainmapper` by both @JRegg66 (thank you) and myself.
Local running of `cellfinder` tests.

## Is this a breaking change?

No

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
	- we might have caught the bug if we improved tests on the brainmapper side  	
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `95abb3b2ee55`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.