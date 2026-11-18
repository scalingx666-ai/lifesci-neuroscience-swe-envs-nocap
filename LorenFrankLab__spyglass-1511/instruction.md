# Issue

**Title:** Set moseq latent_dim

## Description

# Description

**Previously**
- The latent dim for moseq's SLDS was always set to the default of 10
- This could lead to errors for models tracking too few keypoints

**This PR**
- defaults `latent_dim` to 10 or the maximum allowable value based on input data shape
- adds option to include `target_variance`
    - If provided will cap the `latent_dim` to that needed to explain `target_variance` in the PCA breakdown

# Checklist:

<!--
For items below with `if`, please mark those that do not apply with N/A

For example:
- [X] N/A. If this PR X, related item.
- [X] If this PR Y, other item.
- [X] I have updated the `CHANGELOG.md` ...

Alter notes example:
```python
from spyglass.example import Table
Table.alter() # Comment regarding the change
```
-->

- [x] NA If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [x] NA If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [x] NA If this PR makes changes to position, I ran the relevant tests locally.
- [x] Y If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a90ab13f3d67`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.