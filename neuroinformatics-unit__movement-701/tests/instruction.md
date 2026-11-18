# Issue

**Title:** Add workflow to check conda installation weekly

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

We recommend conda-forge as one of our installation methods, but all of our CI infrastructure currently relies on installing `movement` via pip. 

This means that installing `movement` from conda-forge is never explicitly tested, except for when we make a new release. Sometimes months may pass between releases; if there is some problem with the conda installation (e.g. because of a dependency update), we won't hear it until a user reports it.

**What does this PR do?**

Adds a new GitHub workflow for checking conda installation, adapted from [`datashuttle`'s workflow](https://github.com/neuroinformatics-unit/datashuttle/blob/main/.github/workflows/conda_install_check.yml), which was added for similar reasons.

It has 3 deviations from the `datashuttle` workflow (other than adapting the OS + Python matrix):

- it can also be triggered manually (useful for diagnosing problems reported by users)
- it installs `movement` alongside `napari` and `pyqt`, as per our current [installation instructions](https://movement.neuroinformatics.dev/latest/user_guide/installation.html) for the GUI version of `movement`. 
- it pins the [setup-miniconda](https://github.com/conda-incubator/setup-miniconda/) action to a specific commit (corresponding to v3.2.0), as recommended by that action's docs. Apparently [dependabot can now deal with this](https://github.blog/changelog/2022-10-31-dependabot-now-updates-comments-in-github-actions-workflows-referencing-action-versions/), including updating the human-readable comment with the SemVer version.

## References

N/A

## How has this PR been tested?

Not sure how to test this other than manually triggering the workflow after merging this PR.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No,

## Checklist:

- [ ] ~The code has been tested locally~
- [ ] ~Tests have been added to cover all new functionality~
- [ ] ~The documentation has been updated to reflect any changes~
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `757e109d3aa6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.