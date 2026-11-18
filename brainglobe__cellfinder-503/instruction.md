# Issue

**Title:** Expose CPU/GPU selection in Napari (default to GPU), remove use_scipy param (always True on CPU), and improve batch_size docstring

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [X] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
To expose GPU/CPU selection and batch size control in the Napari plugin, and to improve usability and performance by automatically handling the `use_scipy` setting depending on the selected device.

**What does this PR do?**
I added device selection (CPU/GPU) in the Napari plugin, defaulting to GPU if available (currently only handling "cuda").

I added some docstrings related to `batch_size`. The `batch_size` parameter was already exposed in the Napari plugin for classification.

The `use_scipy` parameter is now handled automatically: if `torch_device` is "cpu", it’s set to `True`; otherwise, `False`. It is no longer exposed in any interface, as requested.

Notes
In `cellfinder/core/main.py`, the parameter passed to the detection step (`detect`) is the one named `classification_batch_size`, while the `batch_size` parameter is used during the classification stage.

The CLI has not been modified, as it lives in the `brainglobe-workflows` repository.

Device selection currently supports `"cuda"` only. Support for other backends like `"mps"` can be added in a future update if needed.


## References

Please reference any existing issues/PRs that relate to this PR.
Issue #464

## How has this PR been tested?

All changes have been tested locally by running the test suite provided in the repository using `pytest`. All tests pass successfully. I also executed all pre-commit hooks (ruff, black, etc.) which report no issues. Additionally, SonarCloud analysis confirms that our changes meet the Quality Gate requirements. I’ll also attach a few screenshots from the tests.


## Is this a breaking change?

No, this PR does not break any existing functionality. All changes are backward-compatible.


## Does this PR require an update to the documentation?
No, only internal docstrings were updated.


## Checklist:

- [X] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [X] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `489d97bed936`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.