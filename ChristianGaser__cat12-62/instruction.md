# Issue

**Title:** Add BIDS-compatible input selection (add-on, upstream unmodified)

## Description

## Summary

CAT12 is currently BIDS-aware only on the **output** side: `cat_io_BIDS.m`
infers `sub-`/`ses-`/`anat` entities from paths of files the user already
selected by hand, purely to decide where derivatives are written. There is
no way to point CAT12 at a BIDS dataset root and have it collect input
itself, no entity filtering, and nothing reads `participants.tsv`.

This PR adds that missing input layer as a self-contained add-on, plus one
small output-side addition (`dataset_description.json`) so CAT12
derivatives are themselves valid BIDS-Derivatives datasets.

## What's added

- `cat_io_BIDSquery.m` — query engine: dataset root + filters → file lists,
  with automatic cross-sectional / longitudinal routing (0-1 session →
  cross-sectional, ≥2 sessions → longitudinal, one group per subject).
- `cat_io_BIDSquery_report.m` — reports what was found *and* what was
  skipped (missing anat dirs, non-matching suffixes, tsv-filtered subjects,
  multiple runs in one session, etc.), so an incomplete selection is never
  silent.
- `cat_conf_BIDSinput.m` / `cat_conf_BIDSinput_query.m` /
  `cat_conf_BIDSinput_run.m` — a new SPM batch module, "BIDS: Data
  selection", exposing the query engine via ordinary batch dependencies
  ("BIDS: cross-sectional files", "BIDS: longitudinal `<subject>`", "BIDS:
  all files"), so it plugs into the existing "CAT: Segmentation" and "CAT:
  Longitudinal" modules without modifying either.
- `BIDS_INPUT_ADDON.md` — usage, options, and testing notes.

Filters: participant list, session list, `acq-`/`run-` regexp, and a
`participants.tsv` filter (`"column op value"`, e.g. `group == patient` or
`age >= 18`, with correct string vs. numeric semantics — see below).

## Changes to existing files

Kept intentionally minimal:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc329861fba5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.