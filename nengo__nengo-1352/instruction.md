# Issue

**Title:** Added 'NoSolver' solver

## Description

**Motivation and context:**
It has come up a few times that it would be nice to set decoders or weights directly. More specifically, loading from previous runs as mentioned in #649, #608. This doesn't facilitate saving and loading per se, but does allow the user to set decoders or weights even if they do not have access to `pre.neurons`. This can be used to help load and save decoders or weights as outlined in nengo/nengo_extras#35.

**How has this been tested?**
Added a new test, all current tests passed.

**How long should this take to review?**
- Quick (less than 40 lines changed or changes are straightforward)

**Where should a reviewer start?**
Just look at the commit.

**Types of changes:**
- New feature (non-breaking change which adds functionality)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [ ] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] All new and existing tests passed.

**Still to do:**
- [ ] Add some error checking on `values` to give better error messages for shape mismatch

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7cce0af14fc6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.