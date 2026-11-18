# Issue

**Title:** Added support for multiple screenshot file formats

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Currently we only support saving screenshots as `.png`. `vedo` seems to support `.pdf`, `.eps`, `.jpg`, and `.svg`. I don't see why we couldn't as well!

**What does this PR do?**
Adds a check to make sure the suffix of the file name is supported before passing it back to `vedo`. If there's no suffix, or it's not supported it just saves it as a `.png`.

## References
 

## How has this PR been tested?
Tested locally

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
Yes, need to document the supported file formats. There are seems to be some weird behaviour when saving as `.eps` or `.svg` where they're written as `.eps.gz` or `.svg.gz` and have to be uncompressed first. 

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3103bab9977`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.