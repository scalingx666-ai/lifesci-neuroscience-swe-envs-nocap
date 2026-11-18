# Issue

**Title:** Add experiences maze and orb

## Description

## What changed

Added two new PiEEG dashboard experiences:

- Neural Maze Lock
- Orb Control

Neural Maze Lock is a small maze game where EOG/WASD moves the player, and focus, calm, and blink signals open different locks.

Orb Control is a simple control demo where focus grabs and charges the orb, EOG/WASD moves it, calm stabilizes it, and blink releases the charge.

Both demos include keyboard/mock controls, so they can be tested without PiEEG hardware, but they also use the existing PiEEG hooks for focus, relax, blink, and EOG input.

## Tested

- Ran `npm run build`
- Checked that generated static dashboard files are not included
- Added README files for both experiences

___

Let me know if need to make any more changes. New to ecosystem so don't mind the mistakes. Also, not sure how it works with hardware, I have only used keyboard mock controls to test.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87c9b5f93c82`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.