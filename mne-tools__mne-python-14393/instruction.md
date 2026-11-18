# Issue

**Title:** Splitting _brain.py into multiple modules (phase 2)

## Description

#### Reference issue (if any)

Second phase of #14331 and following #14359.

#### What does this implement/fix?

When something changes in a `Brain` (you move to a new time point or change the colour limits), two kinds of things need updating:

1. The scene: the brain surface colours, the colour bar, the current time which lives in `_brain.py`.
2. The time viewer: the dock sliders, and the dashed time cursor on the traces plot which lives in `_time_viewer.py`, and only exists if `setup_time_viewer()` was called.

Until now, `_brain.py` did both. Now after the scene has updated itself, it now just announces "I've changed" by publishing a private event. The time viewer listens for that and updates its own widgets.

#### Additional information

Opus 5.5 implemented the changes, I reviewed and iterated over it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1d318cb8c2a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.