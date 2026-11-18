# Issue

**Title:** Accept pandas Series/ExtensionArray in add_scratch; lift pandas<3 cap

## Description

## Motivation

Pandas 3.0 makes `ArrowStringArray` the default backing for every DataFrame string column, so `df['col'].values` is now an `ExtensionArray` rather than an `ndarray`. `NWBFile.add_scratch` rejected such values at the PyNWB `docval` layer before HDMF's coercion could run, and PyNWB capped `pandas<3`.

The HDMF side was fixed in hdmf-dev/hdmf#1469 (shipped in HDMF 6.1.0), which centralizes coercion of `pd.Series`/`ExtensionArray` to numpy at the `Data.__init__`/`Data.extend` boundary. Because PyNWB never overrides the `array_data` macro, that fix propagates automatically to `TimeSeries` subclasses, `add_unit`, `add_electrode`, `DynamicTable.from_dataframe`, etc. The only PyNWB-specific surface needing a change is `add_scratch`, which uses its own hand-rolled type tuple.

Context: hdmf-dev/hdmf#1384, hdmf-dev/hdmf#1469.

## How to test the behavior
```python
import pandas as pd
from pynwb import NWBFile
from datetime import datetime, timezone

nwb = NWBFile(session_description='x', identifier='y',
              session_start_time=datetime.now(timezone.utc))
df = pd.DataFrame({'animal': ['cat', 'dog']})
nwb.add_scratch(df['animal'].values, name='a', description='d')  # ArrowStringArray on pandas 3
```

## Changes

- `NWBFile.add_scratch`: accept `pd.Series` and `pandas.api.extensions.ExtensionArray` in the `data` docval type tuple and the array-branch `isinstance` check; updated docstring and error messages. Coercion to numpy happens in HDMF's `Data.__init__`, not in PyNWB.
- `pyproject.toml`: lifted the `pandas<3` cap and bumped the minimum HDMF dependency to `>=6.1.0`.
- `tests/unit/test_scratch.py`: added tests passing `pd.Series` (numeric and string), `StringArray`, and (pyarrow-guarded) `ArrowStringArray`; updated the widened error-message assertions.

Verified the full unit suite passes under pandas 3.0.2 + pyarrow + HDMF with #1469.

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [ ] Is your contribution compliant with our coding style? This can be checked running `ruff` from the source directory.
- [x] Have you checked to ensure that there aren't other open or previously closed [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc3ff5e3681e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.