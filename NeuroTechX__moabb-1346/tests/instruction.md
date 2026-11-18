# Issue

**Title:** fix(timeline): accurate stimulus protocol diagrams for self-paced, auditory, cognitive, and cue-based datasets

## Description

## Summary
- Fixes `Thapa2025` stimulus protocol diagram to accurately depict its self-paced freewill reach-and-grasp protocol from Fig. 1 of Thapa, Boggess & Bae (2025) (*Scientific Data* 12:1760): `Audio 'Start'` (`0–1s`) -> `Self-Paced Motor Execution` (`1–12s`) -> `Break / Rest` (`12–19s`), with note indicating the `[0, 4]s` epoch locked to accelerometer movement onset (no fixation cross).
- Systematically fixes `_extract_mi_timeline` in `moabb/analysis/timeline.py` across all 123 imagery/execution datasets and adds `_extract_cognitive_timeline` for cognitive datasets (`BNCI2024_001`, `Shin2017B`, `Wang2026Handwriting`):
  - Self-paced (`Thapa2025`, `BNCI2020_001`, `Kueper2024`, `BNCI2025_001`, `BNCI2025_002`), asynchronous (`Wairagkar2018`), continuous (`Forenzo2023`), and auditory-only (`Brandl2020`, `Daly2020`, `Ortiz2023`, `PoloHortiguela2025`, `Rozado2015`) protocols never receive a fabricated `Fixation +` block.
  - Cue-based protocols properly honor `cue_duration_s`, `imagery_duration_s`, `trial_duration`, and `interval` from `METADATA`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d5133aa97b22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.