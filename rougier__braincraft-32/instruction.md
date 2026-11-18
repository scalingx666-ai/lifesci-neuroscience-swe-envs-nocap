# Issue

**Title:** Task 2: add Bio Player (pointwise-activation ESN with colour cue) — 14.78 ± 0.20

## Description

## Summary

Adds `braincraft/env2_player_bio.py`, a handcrafted pointwise-activation Echo State Network controller for Task 2, together with a full model description in `braincraft/env2_player_bio.md`.

No learning / no training loop — the weight matrices are fixed at build time and the single `yield` in `bio_player()` returns the frozen model.

## Approach

Extends the env1 bio player (same pointwise-ESN shape: every hidden activation is a scalar function of its own preactivation, all cross-neuron logic in `W` / `Win`) with the Task 2 colour cue. The controller combines:

- a **reflex wall-follower** (proximity / safety / hit taps),
- an **initial-heading correction** over a six-step seed window that cancels the ±5° start-direction perturbation,
- a **rising-edge energy-reward detector** that arms the shortcut,
- a **heading-gated corridor shortcut** triggered only when `pos_x` hits  `±drift_offset` with a horizontal heading,
- a **blue-evidence circuit** — per-ray blue-bump detectors feeding a  signed integrator (`evidence`) with left/right sums; a `±color_evidence_thr` threshold latches a signed front-block state (`fs_pos` / `fs_neg`),
- a **signed front-block** (`front_block_pos`, `front_block_neg`) driven by the two centre proximity taps and gated by the latched sign, so a frontal obstacle steers toward the open (blue) side rather than a fixed direction.

Readout has nine non-zero `Wout` entries; see `env2_player_bio.md` for the full activation library, slot layout, wiring equations, and gains.

## Assumed performance

Running `python braincraft/env2_player_bio.py` (seed 12345, 10 runs):

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `697d259c792e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.