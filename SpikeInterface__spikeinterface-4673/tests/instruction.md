# Issue

**Title:** Enhance single channel denoiser and `WaveformNode`

## Description

Extend flexibility of `WaveformNode` and single channel denoiser. Now testing against toy and yass models here: https://huggingface.co/SpikeInterface/waveform_denoiser

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af342e6e2ea6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.