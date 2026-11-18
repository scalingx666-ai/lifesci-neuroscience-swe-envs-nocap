# Issue

**Title:** Fix links to SLEAP analysis h5 docs

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

The links to the SLEAP docs about analysis h5 files are broken. This is due to a restructure of SLEAP docs by a recent release. See an example of a [failing CI job](https://github.com/neuroinformatics-unit/movement/actions/runs/21778608835/job/62839162556?pr=805).

**What does this PR do?**

Fixes 3 occurrences of the broken link, by pointing it to the new location in SLEAP docs.

## References

N/A

## How has this PR been tested?

Running linkcheck locally and in CI.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

N/A

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fffc05ff5174`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.