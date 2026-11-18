# Issue

**Title:** Normalize poses by body length for Moseq

## Description

This pull request adds pose normalization functionality to the behavior analysis pipeline, allowing pose datasets to be normalized by animal length using specified anterior and posterior body parts. The changes introduce new normalization functions, update the `fetch_pose_datasets` method to support normalization, and ensure normalization is applied in relevant downstream analyses.

**Pose normalization support:**

* Added `normalize`, `anterior_bodyparts`, and `posterior_bodyparts` parameters to `PoseGroup.fetch_pose_datasets` to enable pose normalization by animal length. The method now normalizes datasets when requested, raising an error if required body parts are not provided. [[1]](diffhunk://#diff-a6d5f037f45ddeea63b1de268960bfb7a57639d1a8d7191d43be001f337e71c8L69-R74) [[2]](diffhunk://#diff-a6d5f037f45ddeea63b1de268960bfb7a57639d1a8d7191d43be001f337e71c8R84-R91) [[3]](diffhunk://#diff-a6d5f037f45ddeea63b1de268960bfb7a57639d1a8d7191d43be001f337e71c8R114-R122)
* Implemented `_normalize_1_pose_dataset` and `normalize_pose_dataset` functions to perform centering and scaling of pose data based on the mean positions and length between specified body parts.
* Exposed `_normalize_1_pose_dataset` for use in other modules and updated imports accordingly.

**Integration with MoSeq processing:**

* Updated calls to `fetch_pose_datasets` in `moseq.py` to pass normalization parameters from `model_params`, ensuring pose normalization is applied during MoSeq model training and inference.
* Applied normalization to pose data in the `make` method of the MoSeq pipeline if requested in `model_params`.# Description


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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `caec56bc3388`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.