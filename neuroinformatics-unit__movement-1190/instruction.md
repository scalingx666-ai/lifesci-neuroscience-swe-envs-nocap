# Issue

**Title:** Keep edited flag of removed points on re-export

## Description

Thanks @anna-teruel for the guidance. I've left the re-added point case out as suggested.

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

The `edited` flag is lost when a deleted point is saved, reloaded and saved again.

**What does this PR do?**

Preserves the `edited` flag for points that remain missing across subsequent saves.

## References

The re-added point case is left for #1060.

## How has this PR been tested?

- Added a round-trip regression test (4 failures without the fix, 4 passes with it).
- Napari test suite passes (371 tests).

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e258141d820`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.