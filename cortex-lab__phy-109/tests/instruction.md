# Issue

**Title:** Make WaveformView work in WebGL

## Description

- Use uint8 textures instead of float32 for better compatibility
- Added old KlustaViewa colormap
- Renamed `field` to `default` in cluster metadata decorator
- Load cluster metadata in kwik
- Added backend option in the interface for VisPy

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9ae7f6258a7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.