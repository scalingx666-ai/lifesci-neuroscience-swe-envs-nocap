# Issue

**Title:** Automatically set format to external on ImageSeries if external file provided

## Description

## Motivation

Fix #2041 

## How to test the behavior?
```python
from pynwb.image import ImageSeries

iS = ImageSeries(name="test_iS",
                 external_file=["external_file", "external_file2"],
                 unit="n.a.",
                 starting_frame=[0, 10],
                 rate=0.2)
print(iS.format)  # external
```

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [X] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [X] Have you ensured the PR clearly describes the problem and the solution?
- [X] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [X] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [X] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4007f030024`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.