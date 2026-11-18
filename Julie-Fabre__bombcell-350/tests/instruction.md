# Issue

**Title:** Refactor/plotting/waveform overlays

## Description

This PR simplifies the generation of waveform overlays further by moving plotting logic to a self-contained function called "generate_waveform_overlay()". In the notebook environment, this new function is called by the original plot_waveform_overlay() to generate all overlay plots at once.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c0b712b1d4ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.