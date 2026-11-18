# Issue

**Title:** Fix `add_data_interface` functionality

## Description

## Motivation

Fix #2050. 

In #2011 I mistakenly removed the functionality of `add_data_interface` when updating the deprecation warning. I think `add_data_interface` should still operate as expected until the function is fully removed and replaced by `add`.


## How to test the behavior?
```python
from pynwb.testing.mock.file import mock_NWBFile
from pynwb.testing.mock.ecephys import mock_ElectricalSeries


nwbfile = mock_NWBFile()

# Create processing modules
ecephys_module = nwbfile.create_processing_module('ecephys', 'Example ecephys data')

electrical_series = mock_ElectricalSeries()
ecephys_module.add_data_interface(electrical_series)

assert len(nwbfile.processing["ecephys"].data_interfaces) == 1
```

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01d9ab92de25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.