# Issue

**Title:** Add VanillaSort external sorter

## Description

Add VanillaSort as an external sorter through its public `vanillasort.sort()` API (requires VanillaSort >= 0.2.1). The wrapper provides lightweight discovery/version checks, 17 serializable parameters, optional CUDA, progress logging, and reloadable multisegment results. Python `gate_fn` callbacks remain available through the direct VanillaSort API.

Detailed [parameters and examples](https://github.com/IgarashiAkatuki/VanillaSort/blob/main/docs/spikeinterface.md) and [wrapper-specific regression tests](https://github.com/IgarashiAkatuki/VanillaSort/blob/main/tests/test_spikeinterface.py) are maintained in VanillaSort. SpikeInterface retains the shared `SorterCommonTestSuite` subclass, its standard installation entry, and external documentation links.

Validation:
- Shared sorter suite: 2 passed using the unchanged 60-second, 25 kHz fixture and published checkpoints on CPU.
- VanillaSort package/integration suite: 21 passed, including direct/wrapper equivalence, saved results/logs, parameter forwarding, fixed-K policies, and 20/25/30 kHz round trips.
- Focused Sphinx build, parameter/default consistency, Black/Ruff, and distribution checks passed.

The 25 kHz common-suite run used . Its removal of the fixed 30 kHz check is unreleased; PyPI 0.2.1 retains that earlier check.

[Repository](https://github.com/IgarashiAkatuki/VanillaSort) · [Models](https://huggingface.co/Kohaku2580/VanillaSort) · [Paper](https://doi.org/10.64898/2026.09.18.752552)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d89765e9b552`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.