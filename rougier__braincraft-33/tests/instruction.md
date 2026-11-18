# Issue

**Title:** Task 3: add Bio Player (pointwise-activation ESN, 7-slot reflex-only) — 14.40 ± 0.49

## Description

## Summary

Adds `braincraft/env3_player_bio.py`, a minimal handcrafted pointwise-activation Echo State Network controller for Task 3, together with a full model description in `braincraft/env3_player_bio.md`.

No learning / no training loop — the weight matrices are fixed at build time and the single `yield` in `bio_player()` returns the frozen model.

## Approach

Same pointwise-ESN skeleton as the env1/env2 bio players — every hidden activation is a scalar function of its own preactivation, all cross-neuron logic lives in the connectivity matrices — but the env3 variant is deliberately stripped down:

- 7 of 1000 hidden slots are active (slots 0–6); the rest are dead.
- Colour and energy inputs are **not read**. The bot runs the outer  corridor as a reflex wall-follower and picks up whatever source it happens to cross, exploiting the known Task 3 outer-ring regularity.
- The circuit is a reflex wall-follower — left/right proximity, left/right safety, hit — plus an unsigned front-block that turns the bot  (CCW) when both centre proximity taps exceed `1.4`.
- Six non-zero `Wout` entries; the `dtheta` slot mirrors the readout row so `dtheta(t+1) = clip(O(t), ±5°)`.

This is the minimal variant of the bio-player family.

## Assumed performance

Running `python braincraft/env3_player_bio.py` (seed 12345, 10 runs)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `697d259c792e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.