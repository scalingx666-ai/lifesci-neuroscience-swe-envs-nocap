# Issue

**Title:** Update nwb-schema to 2.11.0 and require HDMF 6.2.0

## Description

Updates the `nwb-schema` submodule to the NWB Schema 2.11.0 release candidate and raises the minimum HDMF version to 6.2.0.

Companion to NeurodataWithoutBorders/nwb-schema#710, which covers the "Ensure PyNWB and MatNWB have branches that have passing tests" item on that release checklist.

### Changes

- Pointed `src/pynwb/nwb-schema` at `f7dae71` ("Prepare 2.11.0 release"), which sets the schema version to 2.11.0 and brings in HDMF Common Schema 1.10.0.
- Raised `hdmf` from `>=6.1.0,<7` to `>=6.2.0,<7` in `pyproject.toml`, and pinned `environment-ros3.yml` to `hdmf==6.2.0`.
- Updated the changelog entry to name 2.11.0 and record the `MeaningsTable.target` change and the HDMF floor bump.

### Why HDMF 6.2.0 is required

NWB Schema 2.11.0 carries HDMF Common Schema 1.10.0, which changes `MeaningsTable.target` from a link to an object-reference attribute. HDMF 6.2.0 bundles that same schema version (`e7f84f0`), so the Python-side `MeaningsTable` definition matches. HDMF 6.1.0 bundles 1.9.0 and still treats `target` as a link.

HDMF 6.2.0 also fixes writing the `unit` and `time_before_peak_in_ms` attributes on the `Units` waveform columns. Under 6.1.0 both fell back to their schema defaults on write, so `TestUnitsCustomWaveformUnitIO` and `TestUnitsWaveformTimeBeforePeakIO` failed on `dev` regardless of which schema commit the submodule pointed at.

### Testing

Full suite run locally against schema 2.11.0 with HDMF 6.2.0:

```
848 passed, 15 skipped, 19 warnings, 6768 subtests passed
```

For comparison, the same suite on `dev` with HDMF 6.1.0 gives 8 failed, 844 passed, 6764 subtests passed. All 8 failures are the two waveform test classes described above and are resolved by the HDMF bump.

### Before merging

The submodule points at a commit on the `prepare_2.11.0` branch of nwb-schema, not a tag. Retarget it at the `2.11.0` tag once nwb-schema#710 merges and the tag is pushed.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6285dd8caf73`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.