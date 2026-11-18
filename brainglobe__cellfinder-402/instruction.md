# Issue

**Title:** Allow turning off classification or detection in GUI

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Currently, there's no way to separately run detection and classification. Because classification takes longer than detection, it's a good idea to be able to tune the detection parameters, without having to run classification as well. Similarly, it'd be nice to be able to generate detected points and then tune the classification parameters without having to re-run detection each time as well.

E.g. we need to tune the detection parameters because that step mises a lot of the cells.

**What does this PR do?**

This PR adds two new options to the GUI - to skip detection (and only run the classification part) and to skip classification (and only run the detection part). It also adds an input, in which you can select a `Points` layer as the points input for the classification step when detection is skipped.

Hence a typical process would be, you run just the detection step until the parameters are tuned. Then, use that steps output layer as input and just run the classification step until that's tuned as well.

## References

I developed this PR on top of the  branch (but committed it on main). But I'll probably need to rebase this PR when that's merged.

## How has this PR been tested?

I tested the process in the GUI.

## Is this a breaking change?

No. All new parameters are optional.

## Does this PR require an update to the documentation?

Not sure if I should update the docs for this as it's optional parameters.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `389e455c9aa5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.