# Issue

**Title:** Task 1: add Bio Player (pointwise-activation ESN) — 14.40 ± 0.36

## Description

## Summary

Adds `braincraft/env1_player_bio.py`, a handcrafted pointwise-activation Echo State Network controller for Task 1, together with a full model description in `braincraft/env1_player_bio.md`.

No learning / no training loop — the weight matrices are fixed at build time and the single `yield` in `bio_player()` returns the frozen model.

## Approach

Every hidden activation is a scalar function of its own preactivation; all cross-neuron logic lives in the connectivity matrices. Forty of the 1000 hidden slots are active; the rest are unused. The controller combines four behaviours:

- a **reflex wall-follower** (proximity / safety / hit taps),
- an **initial-heading correction** that cancels the ±5° start-direction
  perturbation so the integrated position (`pos_x`, `pos_y`) tracks true
  position,
- a **rising-edge energy-reward detector** that arms a shortcut once the
  bot has seen its first source,
- a **pose-gated corridor shortcut** that fires when the reward has been
  seen and the bot crosses a clear horizontal corridor, steering by
  `sign(sin(phi)) · sign(pos_y)`.

See `env1_player_bio.md` for the full activation library, slot layout, wiring equations, and readout weights (eight non-zero `Wout` entries).

## Assumed performance

Running `python braincraft/env1_player_bio.py` (seed 12345, 10 runs):

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `697d259c792e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.