# Issue

**Title:** Fix discrete decoder correction defaults

## Description

.

Changes proposed in this pull request:

- Change the default correction method for the BrainMap and Neurosynth discrete decoders from `fdr_bh` to the supported `bh` value.
- Handle `correction=None` explicitly and raise a `ValueError` for unsupported correction methods.
- Update the decoding documentation to match the supported correction options.

Testing:

- `pytest nimare/tests/test_decode_discrete.py -q`
- `make lint`

## Summary by Sourcery

Correct discrete decoder correction defaults and validation to align behavior with the supported correction methods.

Bug Fixes:
- Use the supported Benjamini–Hochberg correction by default for BrainMap and Neurosynth discrete decoders.
- Handle uncorrected decoding explicitly when correction is None and reject unsupported correction methods with a clear error.

Documentation:
- Update decoding documentation to reflect the supported multiple-comparison correction options.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ce1c34d2c018`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.