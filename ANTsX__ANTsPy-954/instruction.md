# Issue

**Title:** BUG: label_image_registration ignored labels with initial_transforms=None

## Description

`label_image_registration(..., initial_transforms=None)` drops the label images. The branch for `'identity'` and transform files, which adds the per-label MSQ metrics, starts with

```python
elif initial_transforms is not None or initial_transforms == 'identity':
```

That is False for `None`, so the deformable stage gets no label metrics:
- **With intensity images:** it registers the intensity images only, without an error.
- **Without them:** antsRegistration has no metric and fails with `RuntimeError: Registration failed with error code 1`.

The docstring says the initial transform is used "if specified", so `None` should mean no initial transform, as `'identity'` does.

This makes that branch an `else`, and skips the transform-file handling for `None`. Changing `is not None` to `is None` instead would drop transform files from this branch.

`test_label_image_registration_without_initial_transforms` checks two things:
- `None` and a list with a transform file pass the same label metrics to antsRegistration as `'identity'`;
- a label-only call with `None` runs.

It fails on main and passes here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `99e85bdf7b6e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.