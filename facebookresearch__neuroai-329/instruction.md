# Issue

**Title:** neuralset: apply MNE projectors right after channel selection; Pydant…

## Description

…ic 2.14 / mypy 2.4 compatibility

Fixes MEG preprocessing with `apply_proj=True`: SSP projectors were applied after per-channel scaling, so they removed the wrong amount of signal. Also keeps the packages working and type-checked with Pydantic 2.14 / mypy 2.4.

- `MneRaw(apply_proj=True)` applies SSP projectors right after channel selection and bad-channel removal, before referencing, filtering, the Hilbert envelope and scaling. They are defined on the raw sensor signals; applied after per-channel scaling they removed the wrong amount from each channel.
- Pydantic 2.14 / mypy 2.4 compatibility: `_Module`'s private-attribute guard runs in `__pydantic_init_subclass__`, after Pydantic finishes constructing the subclass; explicit `type[tp.Any]` parameters in subclass helpers.

## What does this PR do?

<!-- Brief description of the change. -->

## Related Issues

<!-- e.g. ,  -->

## Checklist

- [ ] Tests added or updated
- [ ] Docstrings updated for any changed public APIs
- [ ] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aa1682aa6587`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.