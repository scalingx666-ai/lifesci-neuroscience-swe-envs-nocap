# Issue

**Title:** Add optional parameters to OpticalSeries constructor

## Description

fix #1616 

# Motivation

The `OpticalSeries` class in PyNWB currently requires the fields 'distance', 'orientation', and 'field_of_view' in its constructor, but according to the NWB schema these fields should be optional. This PR fixes this discrepancy by making these fields optional in the code to match the schema specification.

# How to test the behavior?
```python
from pynwb.image import OpticalSeries

# Create OpticalSeries without the optional fields
optical_series = OpticalSeries(
    name='test_optical_series',
    data=np.ones((2, 2, 2)),  # example data
    unit='pixels',
    timestamps=[1.0, 2.0]
)

# All these fields should be None
assert optical_series.distance is None
assert optical_series.field_of_view is None
assert optical_series.orientation is None
```

# Checklist
[x] Did you update CHANGELOG.md with your changes?
[x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
[x] Have you ensured the PR clearly describes the problem and the solution?
[x] Is your contribution compliant with our coding style? This can be checked running ruff check . && codespell from the source directory.
[x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
[x] Have you included the relevant issue number using "Fix #1616" notation where XXX is the issue number? By including "Fix #1616" you allow GitHub to close issue #1616 when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3b3306adf2e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.