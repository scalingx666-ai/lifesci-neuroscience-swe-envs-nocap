# Issue

**Title:** Map Units waveform metadata to waveforms

## Description

## Motivation

This change fixes a mismatch between the NWB schema and the PyNWB `Units` mapper for waveform metadata.

The schema defines `sampling_rate` and `unit` attributes on `waveform_mean`, `waveform_sd`, and `waveforms`, but PyNWB only propagated `Units.waveform_rate` and `Units.waveform_unit` to `waveform_mean` and `waveform_sd`. As a result, a `Units` table containing only `waveforms` would lose waveform sampling metadata on write, and `waveform_rate` would not round-trip on read.

Fix #2182.

## What changed

- Extend the write-side `VectorData` mapper so `Units.waveform_rate` and `Units.waveform_unit` are also written to the `waveforms` column attributes.
- Extend the read-side `UnitsMap` logic so it also considers `waveforms` when reconstructing waveform metadata.
- Add an integration test that round-trips a `Units` table with only `waveforms` and verifies both the in-memory metadata and the on-disk attributes.

## How to test the behavior?

```bash
PYTHONPATH=src python -m unittest tests.integration.hdf5.test_misc.TestUnitsWaveformsOnlyIO tests.integration.hdf5.test_misc.TestUnitsIO
```

## Checklist

- [ ] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [ ] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [ ] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

Prepared with Codex.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1783a17fbbc2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.