# Issue

**Title:** Pin aiobotocore for downstream env resolution

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
`pip` dependency resolution got stuck in a loop working backward through compatible version of `botocore` and `aiobotocore`. This gives it a floor to work with to allow resolution to succeed.

Also addresses a similar issue with `cloud-volume` see 

**What does this PR do?**
Pins `aiobotocore>=3.6.0`.
Pins `cloud-volume>=12`.

## How has this PR been tested?
Tested by locally building an environment with `pip` with or without the pin. All tests pass with the pin.

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec2bdf805b3b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.