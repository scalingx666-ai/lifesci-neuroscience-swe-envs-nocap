# Issue

**Title:** Return ObjectMapper.NO_OVERRIDE from override functions instead of None

## Description

## Motivation

Depends on .

That HDMF PR adds `ObjectMapper.NO_OVERRIDE`, a sentinel that a `constructor_arg` / `object_attr` override function returns to fall through to the value built from the file or read from the container. HDMF 6.2.0 deprecates the previous convention of returning `None` for that purpose: returning `None` still falls through, but emits a `DeprecationWarning` when doing so actually changes the result, and in HDMF 8.0 a `None` return will set the constructor argument or attribute to `None`, which would drop data.

Several PyNWB override functions use the old `None`-means-no-override idiom, so they emit the new warning against HDMF 6.2.0 and would break under HDMF 8.0. `trials`/`epochs`/`invalid_times` reads from schema >= 2.5 fire it on every read, so downstream tools that treat warnings as errors (e.g. [dandi-cli](https://github.com/dandi/dandi-cli/actions/runs/29777728823/job/88471108820)) fail once HDMF 6.2.0 is installed against a current PyNWB.

## Changes

Migrates the affected override functions to return a `NO_OVERRIDE` sentinel instead of `None`. The sentinel is defined once in `src/pynwb/io/utils.py` and resolved with `getattr`:

```python
NO_OVERRIDE = getattr(ObjectMapper, "NO_OVERRIDE", None)
```

This resolves to `ObjectMapper.NO_OVERRIDE` on HDMF >= 6.2.0 (no warning) and to `None` on older HDMF (where the sentinel and the warning do not exist, so `None` is still the correct signal). The override functions therefore work on both, so **the minimum HDMF version stays at `>=6.1.0`, no floor bump**, and this can be released before HDMF 6.2.0 to close the gap for tools that treat warnings as errors.

Active mappers:
- `io/epoch.py` `TimeIntervalsMap.columns_carg` (highest impact: fires on every `trials`/`epochs`/`invalid_times` read from schema >= 2.5)
- `io/device.py` `DeviceMapper.model_carg`
- `io/file.py` `NWBFileMap.experimenter_obj_attr` and `publication_obj_attr`

Legacy NWB 1.x mappers (`pynwb.legacy`):
- `legacy/io/base.py` `carg_starting_time`, `carg_rate`
- `legacy/io/ophys.py` and `legacy/io/image.py` `carg_data`
- `legacy/io/behavior.py` `carg_time_series` (Behavioral + PupilTracking)

Override functions that return `None` only when the target field is absent (so the fall-through value is also `None`) are left as-is; they neither warn nor change behavior in HDMF 8.0.

## Verification

- New HDMF (with `NO_OVERRIDE`): full HDF5 integration + unit suite passes with `DeprecationWarning` promoted to an error, including `trials`/`experimenter`/`related_publications` roundtrips. Reverting this change reproduces the warning on `trials`/`epochs` roundtrips.
- Old HDMF (6.1.0, no `NO_OVERRIDE`): the shim resolves to `None`, preserving current behavior.

## Note for downstream consumers

This fix protects code that upgrades to the PyNWB release containing it. It cannot change the already-released PyNWB 4.0.0, whose `hdmf<7` pin will still pull HDMF 6.2.0 and warn. Tools such as dandi-cli should require the fixed PyNWB release (`pynwb>=4.0.1`).

## Checklist

- [x] Did you update `CHANGELOG.md` with your changes?
- [x] Does the PR clearly describe the problem and the solution?
- [x] Have you reviewed our [Contributing Guide](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst)?
- [ ] Does the PR use "Fix #XXX" notation to tell GitHub to close the relevant issue numbered XXX when the PR is merged?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77aa282cf61e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.