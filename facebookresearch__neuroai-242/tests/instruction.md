# Issue

**Title:** neuralbench: describe backbone and pretraining corpus on ModelEntry

## Description

`ModelEntry` carries no structured description of a model's backbone or of the
corpus it was pretrained on, so comparing two entries means reading the
free-text `pretrain_data` string.

Four optional fields, all defaulting to `None`:

- `architecture` — coarse backbone family, one of `"Convolutional"`,
  `"Transformer"`, `"Linear"` or `"MLP"`. Set on every entry except
  `VEMG2Pose`.
- `pretrain_n_subjects`, `pretrain_n_hours` — pretraining corpus size, set for
  the two foundation models whose papers report it (LaBraM, REVE).
- `fmri_space` — representation space for fMRI models; declared for
  completeness, no entry sets it yet.

The fields are data only: nothing in the package reads them. They exist for
docs figures that group and scale models by these dimensions, which are not
part of this change.

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `41aae4c72470`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.