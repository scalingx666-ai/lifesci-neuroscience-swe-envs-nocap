# Issue

**Title:** Fix blit and add selectable

## Description

Fixes a bug introduced by the new blitting code where if you had, say, 8 blitted axes, the figure would be `draw_idle`d 8 times. The fix is to use a single blitting manager monkey-patched onto the figure. Blitting is a figure-level operation, so it makes sense to share a single manager. Also adds a `selectable` option to TFR plotting (was previously effectively hard-coded to `True`) to avoid some potential redraws when making static figures. Slowdown identified with the help of Claude Opus 5.5, which I then used to draft the changes, too (but I reviewed, understand, and iterated on them).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f121214765c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.