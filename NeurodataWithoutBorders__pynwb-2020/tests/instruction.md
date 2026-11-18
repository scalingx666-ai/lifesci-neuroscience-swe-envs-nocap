# Issue

**Title:** Dict-like methods for ProcessingModule

## Description

# Motivation

Added support for dictionary-like operations directly on `ProcessingModule` objects. Currently, users need to access the `data_interfaces` attribute to get information about the module's contents (e.g., `len(module.data_interfaces)`). This PR implements dictionary-like methods on `ProcessingModule` itself, making the API more intuitive and consistent with Python's container conventions.

This implements the feature requested in #1993 to support operations like `len(processing_module)` directly.

How to test the behavior?
```python
from pynwb import NWBFile
from pynwb.base import TimeSeries
import datetime

# Create an NWB file with a processing module
nwbfile = NWBFile(
    session_description='demonstrate module dict operations',
    identifier='ABC123',
    session_start_time=datetime.datetime.now(datetime.timezone.utc)
)

behavior_module = nwbfile.create_processing_module(
    name='behavior',
    description='behavioral data'
)

# Add some time series
ts1 = TimeSeries(name='series1', data=[1, 2, 3], unit='m', rate=1.0)
ts2 = TimeSeries(name='series2', data=[4, 5, 6], unit='m', rate=1.0)

behavior_module.add(ts1)
behavior_module.add(ts2)

# Test new dictionary-like operations
print(len(behavior_module))  # 2
print(list(behavior_module.keys()))  # ['series1', 'series2']
print(list(behavior_module.values()))  # [<TimeSeries 'series1'>, <TimeSeries 'series2'>]

for name, interface in behavior_module.items():
    print(f"{name}: {len(interface.data)} samples")
```

Checklist
[x] Did you update CHANGELOG.md with your changes?
[x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
[x] Have you ensured the PR clearly describes the problem and the solution?
[x] Is your contribution compliant with our coding style? This can be checked running ruff check . && codespell from the source directory.
[x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
[x] Have you included the relevant issue number using "Fix #1993" notation where XXX is the issue number? By including "Fix #1993" you allow GitHub to close issue #1993 when the PR is merged.
Fix #1993

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `804aad866e2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.