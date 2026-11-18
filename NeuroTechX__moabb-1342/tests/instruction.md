# Issue

**Title:** Fix Thapa2025 and motor-execution Stimulus Protocol / webpage rendering

## Description

Fixes the Stimulus Protocol timeline diagram, dataset header chip/subtitle, and metadata catalog for motor-execution datasets (`Thapa2025`, `Kueper2024`, `NeBULA2025`, `PerezBlanco2026`, `Schirrmeister2017`, `GuttmannFlury2025_ME`, `Wu2020`) so they render **Motor Execution** instead of **Motor Imagery** on the documentation pages (reported by Bhoj Raj Thapa).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `043ffeab1b25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.