# Issue

**Title:** MRG: Always force GUI updates

## Description

@nfoti can you see if this fixes your problem?

This forces a GUI process loop update when calling `_force_render`, which is useful e.g. to deal with the toolbar removal at the beginning. @nfoti found that getting the model-view matrix in a script was different before/after allowing the interpreter to idle, which is a sign that the idle-GUI-loop code was doing something to the display, which shouldn't happen if no interaction has taken place and we are properly forcing rendering changes.

Tests pass locally, let's see if the CIs are happy.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c614fe0b3126`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.