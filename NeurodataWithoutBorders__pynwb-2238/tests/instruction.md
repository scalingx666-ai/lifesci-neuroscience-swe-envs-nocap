# Issue

**Title:** Add model and serial_number parameters to mock_Device

## Description

## Motivation

Follow-up to the review of #2232, which surfaced `mock_Device` as the other half of the `Device`/`DeviceModel` gap.

`Device` links to a `DeviceModel` through its `model` field, and carries a `serial_number`. `mock_Device` exposed neither. The only device metadata it could set was `manufacturer`, which `Device` deprecates in favor of `DeviceModel.manufacturer` and warns on. So `mock_Device` had no way to produce a `Device` in the shape the schema now recommends.

This PR adds `model` and `serial_number` parameters and passes them through.

The `model` case needs one piece of care: `Device.model` is a link, so the `DeviceModel` has to be in the same `NWBFile` or the write raises an orphan-container error. `mock_Device` adds the `DeviceModel` to the `NWBFile` when it is not already there, keeping the one-line call writable:

```python
nwbfile = mock_NWBFile()
mock_Device(model=mock_DeviceModel(manufacturer="Imec"), nwbfile=nwbfile)
# nwbfile now holds both the Device and the linked DeviceModel
```

Passing a `DeviceModel` that is already in the file (the `mock_DeviceModel(nwbfile=nwbfile)` case) links it without a second add. Passing a *different* `DeviceModel` whose name is already taken raises `ValueError` from `add_device_model` rather than silently leaving a dangling link.

`manufacturer` is left in place. It is deprecated on `Device` and already warns from `Device.__init__`, but `pynwb.testing.mock` is public API and removing the parameter would break downstream callers. Happy to deprecate it here on its own schedule if you would prefer.

## Notes for the reviewer

- **`serial_number` is slightly beyond the reviewed gap.** It is the only other non-deprecated `Device` field the mock could not set, so including it makes `mock_Device` complete rather than inviting an immediate follow-up. Say the word and I will drop it.
- **Changelog placement.** I put this under `### Added` in `4.1.1 (Unreleased)`. New parameters arguably belong in a minor release, so move it to a `4.2.0` section if that fits the release plan better.
- This branches off `dev`, not off #2232. The new tests pass `manufacturer` to `mock_DeviceModel` explicitly, so they do not depend on that PR landing first, and there is no conflict between the two branches.

## How to test the behavior?

Four unit tests were added to `tests/unit/test_mock.py`, covering the link, the add-to-file behavior, the already-present case, the name clash, and a round-trip write.

Run locally on Python 3.14, HDMF 6.x:

| Command | Result |
| --- | --- |
| `pytest tests/unit` | 573 passed, 1 skipped (570 before; the 4 new tests, minus 1 pre-existing skip difference in count reporting) |
| `pytest tests/integration/hdf5` | 213 passed, 2 skipped, 6368 subtests |
| `ruff check .` | All checks passed |
| `codespell` | clean (the only hits are in gitignored auto-generated `docs/source/tutorials/` output) |

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [ ] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

No issue filed; this came out of the #2232 review discussion.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b3d8d2935a68`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.