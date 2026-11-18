# Issue

**Title:** feat(experiences): add live neural sonification

## Description

EEG band powers drive a 5-layer Web Audio synthesiser:
- Delta → deep drone (sub-sine, volume + pitch bend)
- Theta → FM pad (modulation depth)
- Alpha → melodic lead (filtered sawtooth, scale-quantised)
- Beta → bright harmonics (square, delay send)
- Gamma → sparkle/shimmer (triangle, delay send)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `df6397ca76fb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.