# Issue

**Title:** Enhance unit test coverage

## Description

## Motivation

Add unit tests to enhance overall test coverage for 
 * Added unit tests for missed logic in `core.py`, `image.py`, `spec.py`, `icephys.py`, `epoch.py`
 * Fixed bug in `IntracellularRecordingsTable`, the `IntracellularResponseTable` was not being initialized correctly when empty category tables were provided
 * Fixed shape check in `SpikeEventSeries` to handle the case where `AbstractDataChunkIterator` are used for timestamps/data

## Checklist

- [X] Did you update CHANGELOG.md with your changes?
- [X] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [X] Have you ensured the PR clearly describes the problem and the solution?
- [X] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [X] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [X] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d8a03e22ef0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.