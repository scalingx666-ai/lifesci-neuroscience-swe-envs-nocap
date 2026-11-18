# Issue

**Title:** Make `neuron` the default package name

## Description

* Previously, `neuron-nightly` was the default package name when installing via a method that read `pyproject.toml`.
* When released, the `packaging/python/change_name.py` was used to change.
* Flip this; by default `pyproject.toml` has `neuron`, and when nightly wheels are updated, the `change_name.py` is used to set the name to `neuron-nightly`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc3ebb278f3b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.