# Issue

**Title:** Allow learning_rate=0

## Description

**Motivation and context:**
Often when working with a learning model it is helpful to quickly disable learning by setting the learning rate to 0.  Currently we don't allow this in Nengo, which isn't the end of the world but just makes things a little awkward.  I think there is pretty minimal downside to allowing it; it seems unlikely that users will accidentally set the learning rate to zero when they do actually want learning.

**How long should this take to review?**
- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
- New feature (non-breaking change which adds functionality)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [x] I have read the **CONTRIBUTING.rst** document.
- [n/a] I have updated the documentation accordingly.
- [n/a] I have included a changelog entry.
- [n/a] I have added tests to cover my changes.
- [n/a] All new and existing tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2591a613c1e9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.