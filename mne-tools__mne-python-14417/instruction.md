# Issue

**Title:** Splitting _brain.py into multiple modules (phase 6)

## Description

#### Reference issue (if any)

Sixth phase of  and following

#### What does this implement/fix?

After this, `_brain.py` calls no time-viewer methods. What's left is the `widgets/time_viewer` setup in `__init__`, and `screenshot/save_movie(time_viewer=True)`.

@larsoner how would you suggest to handle `screenshot/save_movie(time_viewer=True)` for the next PR?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `63132dade0c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.