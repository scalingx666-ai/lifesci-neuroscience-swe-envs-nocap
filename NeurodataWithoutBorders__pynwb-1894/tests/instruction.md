# Issue

**Title:** Avoid having to set `rate=None` explitctly when passing timestamps in  `mock_ElectricalSeries`

## Description

## Motivation

Right now you get the following error when trying to pass timestamps to the `mock_ElectricalSeries` function. 

```python
from pynwb.testing.mock.ecephys import mock_ElectricalSeries


mock_ElectricalSeries(timestamps=np.arange(10))
ValueError: Specifying rate and timestamps is not supported.
```

This is because we have `rate=30,000.0` as a default value in the function signature. To make this work, the user has to explictly set rate=None, that is:

```python
from pynwb.testing.mock.ecephys import mock_ElectricalSeries


mock_ElectricalSeries(timestamps=np.arange(10), rate=None)
```

This is too cumbersome. This PR simplifies this so this is not necessary. To do this, it moves the logic of default values inside the function.

I also added some missing typing.

## How to test the behavior?
The code above should work.

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `flake8` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86b274dc28f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.