# Issue

**Title:** Tracing tool: inherit basic actions from Navigator

## Description

This removes the navigation actions (zoom, pan) from the
Tracing tool and instead inherits them from Navigator.

It also removes a keycode ambiguity between '.' and 'DEL'. Moving
down in z now only works with the actual '.' key and not anymore with the one
on the numeric keypad. Before, in Navigator, one could also move down
in z with the 'DEL/.' key on the numeric keypad. However, this key is
used to delete the active node in the Tracing tool.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5110ca2f9563`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.