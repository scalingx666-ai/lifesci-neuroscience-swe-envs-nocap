# Issue

**Title:** feat: add spectral analysis utilities and integrate spectrum API endpoint

## Description

Adds reusable spectral (FFT/band-power) utilities and wires a cached spectrum response into both the WebSocket server and the dashboard HTTP server so clients can query latest band powers via /api/spectrum.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b5260ee199a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.