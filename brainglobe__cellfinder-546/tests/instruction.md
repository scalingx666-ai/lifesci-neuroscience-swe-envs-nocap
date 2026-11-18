# Issue

**Title:** Expose pin_memory to main and napari

## Description

## Description

This depends on 

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

`pin_memory` is already used in detection, and will be used in classification. It should be exposed so users can use it to speed up GPU data uploading.

I didn't initially add it to classification as well. But I added it because we will need it and we will need to add it to brainglobe-workflows to pass it on. And making workflows being able to pass this parameter to both detection and classification, even before we start using it, will reduce compatibility issues.

**What does this PR do?**

It exposes it in napari and in the main functions. But it defaults to not being enabled due to the requirement of the data memory not being paged out of RAM if it's used. So users will need to turn it ON manually.

## References



## How has this PR been tested?

Checked that it looks ok in napari.

## Is this a breaking change?

No. It does change the default for detection from pinning to not pinning. But I added the default when we moved detection to pytorch.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4224d72a38e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.