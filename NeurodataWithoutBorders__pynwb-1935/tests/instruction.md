# Issue

**Title:** Change epoch tags to property

## Description

## Motivation

* Fix 
* Fix 

`epoch_tags` could be assigned in the `NWBFile` constructor, but it was never written to disk. It could also be out of sync with the epochs table. It seems that it was maybe originally meant to be a shortcut for getting all of the unique epoch tags from the `epochs` table.

As a side effect of this change, `epoch_tags` would no longer be displayed by `__repr__` or `_repr_html_` (I looked a little into getting it to display, but if we include properties in the reprs it makes several other different datatype print outs less clean).

See related discussion about deprecating here: 

## How to test the behavior?
```python
from datetime import datetime
from dateutil.tz import tzlocal
from pynwb import NWBFile, NWBHDF5IO

nwbfile = NWBFile(
    session_id='test',
    session_description='test',
    identifier='12345',
    session_start_time=(
        datetime.now(tzlocal())
    ),
)
nwbfile.add_epoch(start_time=1.0, stop_time=10.0, tags=["tag1", "tag2"])
nwbfile.add_epoch(start_time=10.0, stop_time=20.0, tags=["tag1", "tag3"])
nwbfile.add_epoch(start_time=1.0, stop_time=10.0, tags="tag4")
print(f'memory: {nwbfile.epoch_tags}').  # memory: {'tag3', 'tag1', 'tag4', 'tag2'}

path = 'test1.nwb'
with NWBHDF5IO(path, 'w') as io:
    io.write(nwbfile)

with NWBHDF5IO(path, 'r') as io:
    nwb_read = io.read()
    print(f'disk: {nwb_read.epoch_tags}'). # disk: {'tag3', 'tag1', 'tag4', 'tag2'}
```


## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [X] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [X] Have you ensured the PR clearly describes the problem and the solution?
- [X] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [X] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [X] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a9f6332b5c2c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.