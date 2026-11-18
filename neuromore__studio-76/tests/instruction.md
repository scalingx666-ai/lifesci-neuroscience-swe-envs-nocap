# Issue

**Title:** CopyTo/Replace File by Drag'n'Drop (+small fix)

## Description

* Fixes a small bug that caused the wrong filesystem tree item to be selected, when a drag'n'drop operation was started at the borders of a tree item and the mouse was directly and quickly moved up/down to the next element before the drag was really started.
* Filesystem widget now additionally supports dragging'n'dropping a file on another file with equal type and if user has update rights on destination file. This will copy the contents of the dragged file into the destination file and hence replace the old contents there (after confirmation popup).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4c8db8c2273`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.