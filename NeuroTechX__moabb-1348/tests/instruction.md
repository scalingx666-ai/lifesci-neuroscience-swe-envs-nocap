# Issue

**Title:** fix(datasets): restore HefmiIch2025 nemar_id (v1.0.5) and enrich ethics/license metadata

## Description

## Summary
- Restores `nemar_id = "nm000347"` and `nemar_subject_template = "{subject:02d}"` on `HefmiIch2025` now that `nm000347` `v1.0.5` (with the corrected subject-session mapping from #1326) is merged and published on NEMAR.
- Adds `ethics_approval` to `Wang2026Handwriting` and `Yagan2023` and sets SPDX `license="LGPL-2.1-or-later"` on `Brodu2012`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07ec47b9d010`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.