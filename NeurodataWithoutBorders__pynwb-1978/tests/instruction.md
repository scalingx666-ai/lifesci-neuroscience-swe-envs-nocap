# Issue

**Title:** Warn if writing a file without the appropriate extension

## Description

## Motivation

Fix  for NWBHDF5IO.

## How to test the behavior?
```python
from datetime import datetime
from dateutil.tz import tzutc
from pynwb import NWBFile, NWBHDF5IO

nwbfile = NWBFile(session_description='a test NWB File',
                             identifier='TEST123',
                             session_start_time=datetime(1970, 1, 1, 12, tzinfo=tzutc()))
with NWBHDF5IO("path.h5", 'w') as io:
    io.write(nwbfile)
```

Warns:
```
UserWarning: The file path provided: path.h5 does not end in '.nwb'. It is recommended that NWB files using the HDF5 backend use the '.nwb' extension
```

## Checklist

- [ ] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f2a494bbdbb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.