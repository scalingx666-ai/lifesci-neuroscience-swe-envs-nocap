# Issue

**Title:** Splitting _brain.py into multiple modules (phase 5)

## Description

#### Reference issue (if any)

Fifth phase of  and following

#### What does this implement/fix?

Moves label-trace plotting out of `add_label` into the time viewer's click handler, so `add_label` no longer knows the time viewer exists.

#### Additional information

in label-trace mode, `brain.add_label()` used to plot a trace too, and used the color cycle instead of the `color` passed. Now only clicking a label plots a trace, and direct calls respect `color`. Is this ok for you @larsoner ?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5eda96edaf3f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.