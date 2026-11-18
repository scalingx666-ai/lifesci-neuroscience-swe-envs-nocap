# Issue

**Title:** Migrate NeuroFlow dashboard to Vue 3

## Description

## What changed
- Migrated the real-time EEG dashboard to Vue 3, Vue Router, and Vite.
- Kept the existing FastAPI REST/WebSocket contracts and legacy quality, model-comparison, and system pages.
- Added Vite development proxy configuration for `/api` and `/ws`.
- Updated the FastAPI root route, PowerShell launcher, and Docker image to serve the Vue production build.

## Validation
- `npm.cmd run build`
- `python -m py_compile backend/app/api_app.py backend/app/fullstack_app.py`
- `python -m unittest discover -s tests -v` (25 tests passed)
- PowerShell parser check for `run_fullstack.ps1`

## Why
The frontend now shares the Vue 3 + Vite stack used by the tumor analysis project, while Python remains responsible for EEG signal processing and model inference.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b6aaed8ab935`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.