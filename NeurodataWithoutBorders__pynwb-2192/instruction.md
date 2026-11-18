# Issue

**Title:** Implement NeurodataWithoutBorders/nwb-schema#690: add source_description to EventsTable; add merge/query helpers to NWBFile

## Description

## Summary

- Adds the optional `source_description` attribute to `EventsTable`, per .
- Updates `AnnotationSeries`, `BehavioralEvents`, and `EventsTable` class docstrings to match the revised schema `doc` strings.
- Adds `NWBFile.merge_events_tables()` and `NWBFile.get_all_events()` per NWBEP001.
- Adds `NWBFile.create_events_table()`.

## Changes

### Schema

Points the `nwb-schema` submodule to the head of nwb-schema#690, which:
- Adds the optional `source_description` attribute to `EventsTable` (free-text label of event origin, e.g. `"Acquisition system"` or `"Manual video review"`).
- Recommends `/events` as the single location for all `EventsTable` instances regardless of provenance.
- Updates deprecation docstrings for `BehavioralEvents` and `AnnotationSeries`.

### `EventsTable`

- New optional `source_description` parameter in `__init__`.
- Updated class docstring to match schema, including the one-event-type-per-table guidance.

### `NWBFile`

- `merge_events_tables(tables)` — merges a list of `EventsTable` objects into a single DataFrame indexed and sorted by timestamp, with a `source_events_table` column identifying the origin table of each row.
- `get_all_events()` — calls `merge_events_tables` on all tables in `NWBFile.events`; returns an empty DataFrame if none exist.
- `create_events_table()` — added via `__clsconf__`; creates and registers an `EventsTable` without requiring a separate import.

### Docstrings and deprecation warnings

- `AnnotationSeries`, `BehavioralEvents`, `EventsTable` class docstrings updated to match nwb-schema#690.
- `AnnotationSeries` and `BehavioralEvents` deprecation warnings now name `nwbfile.add_events_table()` and `nwbfile.create_events_table()` as the migration target.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a25682867210`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.