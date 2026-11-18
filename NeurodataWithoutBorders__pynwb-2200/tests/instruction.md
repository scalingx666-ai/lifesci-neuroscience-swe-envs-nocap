# Issue

**Title:** Add HERD tutorial and DANDI streaming example

## Description

## Motivation

HERD (HDMF External Resources Data Structure) is a stable `hdmf-common` type, and NWB schema 2.10.0 added an optional slot for it at `/general/external_resources`. PyNWB had no HERD tutorial, and the only existing guidance (in hdmf) stopped at `HERD.from_zip(...)` without showing how to access the loaded data (hdmf-dev/hdmf#1325).

This adds:

- **`docs/gallery/general/plot_external_resources.py`** (executed): a concise, NWB-focused tutorial that creates a HERD, annotates NWB objects (`Subject.species`, an electrodes-table column against the Allen Mouse Brain CCFv3) with `add_ref`, stores the HERD inside the NWB file, round-trips it, and inspects the loaded data via `to_dataframe()`, `get_object_entities()`, and the individual interlinked tables. It links out to the comprehensive hdmf HERD tutorial rather than duplicating it.
- **`docs/gallery/general/resources_streaming.py`** (rendered but not executed during the offline docs/example build): a companion example that annotates multiple NWB files streamed from a DANDI dandiset with a single shared HERD, then reloads the saved HERD with `from_zip` to add and persist a further annotation.

It also adds:

- **`NWBFile.get_external_resources()`** (`src/pynwb/file.py`): a get-or-create accessor that returns the file's existing HERD or constructs and attaches a new empty pynwb HERD (carrying the pynwb type map) when the file has none, mirroring `get_intracellular_recordings()`. The `external_resources` attribute continues to return the HERD or `None` without creating one. The tutorial uses this accessor so it does not clobber a HERD read from disk. Covered by a new unit test in `tests/unit/test_resources.py`.
- A dedicated **`run-streaming-example`** job in `.github/workflows/run_all_tests.yml` that installs the streaming dependencies and runs `resources_streaming.py` once on the daily/release schedule, since that example is excluded from the offline example tests (it streams from the DANDI Archive). `test.py` gains a `streaming_examples` exclusion list for this and cleans up the tutorial's output file.

It removes the now-dead `"HERD is experimental"` warning filter from `tests/unit/test_resources.py`, since HERD no longer emits that warning.

This supersedes #1781, whose `plot_resources.py` was an unfinished port of the hdmf tutorial that predates HERD becoming non-experimental and storable in an NWB file. The streaming example here salvages and updates that PR's DANDI idea, so its author @mavaylon1 is credited as a co-author.

## How to test the behavior?

```
# Run the executed tutorial directly (cleans up after itself):
python docs/gallery/general/plot_external_resources.py

# Run the streaming example (streams from the DANDI Archive, needs network access):
python docs/gallery/general/resources_streaming.py

# Run the HERD unit tests:
pytest tests/unit/test_resources.py
```

The streaming example reads over the network and is not executed during the offline docs/example build; it runs in the dedicated `run-streaming-example` job in `run_all_tests.yml`.

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `flake8` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [ ] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f7274a610b25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.