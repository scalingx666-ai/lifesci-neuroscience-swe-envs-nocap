# Issue

**Title:** Allow examples/neurons.py to run successfully when neuromorpho is down

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
The test running each example script occasionally fails when neuromorpho.org is down.

**What does this PR do?**
Place the code relating to connecting to neuromorpho.org in a try-catch block that allows the example to still run if a `ConnnectionError` is encountered.

## References

## How has this PR been tested?
Tested locally, `examples/neurons.py` can be run and renders the neuron stored locally.

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
No

If any features have changed, or have been added. Please explain how the documentation has been updated (and link to the associated PR). See [here](https://brainglobe.info/community/developers/index.html#to-improve-the-documentation) for details.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f7271bf2d468`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.