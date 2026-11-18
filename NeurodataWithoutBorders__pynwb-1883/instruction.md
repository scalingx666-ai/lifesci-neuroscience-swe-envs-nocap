# Issue

**Title:** Add default `name="units"` to `Units` object in the `mock_Units` testing function

## Description

Related to this discussion here:


This is a quality of life small change that would allow two things to work:
* This part of the code:
https://github.com/h-mayorquin/pynwb/blob/ad6b0283c49ce8c391fd1b0e6ced3d0f6907c17d/src/pynwb/testing/mock/ecephys.py#L148-L150
* The following script for testing:

```python
from pynwb.testing.mock.file import mock_NWBFile
from pynwb.testing.mock.ecephys import mock_Units

nwbfile = mock_NWBFile()
units_table = mock_Units(num_units=5)
nwbfile.units = units_table
```

The only downside is that for `Units` object that are destined for some other places of the nwbfile (.e.g processing) this will not follow the best practices.  As these are functions that are mainly used for testing I think that this is not a big deal.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2259bede338f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.