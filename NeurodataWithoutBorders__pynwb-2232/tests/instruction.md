# Issue

**Title:** Fix mock_DeviceModel defaulting manufacturer to None

## Description

## Motivation

`mock_DeviceModel` has been unusable since it was introduced in #2088.

It declares `manufacturer: str = None`, but `DeviceModel.__init__` requires `manufacturer` to be a `str` (it is a required `docval` argument with no default). Every call therefore raises:

```
TypeError: DeviceModel.__init__: None is not allowed for 'manufacturer' (expected 'str', not None)
```

This went unnoticed because `mock_DeviceModel` is referenced by no test — it was never added to the `mock_functions` list in `tests/unit/test_mock.py` that drives the parametrized `test_mock` and `test_mock_write` tests. `pynwb.testing.mock` is a public, documented surface used by downstream packages, so the mock being non-functional is a real defect rather than an internal test-only concern.

This PR defaults `manufacturer` to `"manufacturer"`, matching the existing `description: str = "description"` convention in the same module, and adds `mock_DeviceModel` to the parametrized list so the behavior is covered going forward.

The annotation `manufacturer: str` also becomes truthful, where previously it was annotated `str` but defaulted to `None`.

## How to test the behavior?

Before this change, on `dev`:

```python
>>> from pynwb.testing.mock.device import mock_DeviceModel
>>> mock_DeviceModel()
TypeError: DeviceModel.__init__: None is not allowed for 'manufacturer' (expected 'str', not None)
```

After this change the call succeeds, and the object round-trips and validates:

```python
from pynwb import NWBHDF5IO, validate
from pynwb.testing.mock.file import mock_NWBFile
from pynwb.testing.mock.device import mock_DeviceModel

nwbfile = mock_NWBFile()
dm = mock_DeviceModel(nwbfile=nwbfile)
with NWBHDF5IO("dm.nwb", "w") as io:
    io.write(nwbfile)
assert not validate(path="dm.nwb")
```

The two new parametrizations fail on `dev` and pass with this change. Confirmed by applying only the test change and reverting the source fix:

```
FAILED tests/unit/test_mock.py::test_mock[mock_DeviceModel] - TypeError: DeviceModel.__init__: None is not allowed for 'manufacturer'
FAILED tests/unit/test_mock.py::test_mock_write[mock_DeviceModel] - TypeError: DeviceModel.__init__: None is not allowed for 'manufacturer'
```

Results with the full change applied, run locally on Python 3.14, HDMF 6.x:

| Command | Result |
| --- | --- |
| `pytest tests/unit` | 563 passed, 3 skipped (561 before; the 2 new are the added parametrizations) |
| `pytest tests/integration/hdf5` | 212 passed, 3 skipped |
| `ruff check .` | All checks passed |
| `codespell` | clean |

Schema validation ran through the `pynwb.validate` API, both in the snippet above and inside the integration round-trip suite, which validates every file it writes. The `python -m pynwb.validate` CLI was not invoked separately.

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [ ] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

No existing issue covers this; I searched the issue tracker and open PRs for `mock_DeviceModel` and found none. Happy to open one first if you would prefer that order.

---

*Disclosure: this contribution was prepared with assistance from Claude Opus 5. The defect was found by programmatically constructing every `pynwb.testing.mock` object and writing/validating the result. All commands reported above were executed locally and their output is reproduced as returned.*

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3eb4348fcf17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.