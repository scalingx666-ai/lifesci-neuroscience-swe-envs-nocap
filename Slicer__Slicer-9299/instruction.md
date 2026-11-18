# Issue

**Title:** BUG: Show normal cursor in message boxes displayed with a wait cursor

## Description

Message boxes wait for user input, but they were displayed with the wait cursor if the caller set an override cursor - for example when a confirmation popup was raised inside a block:
`slicer.util.tryWithErrorDisplay(..., waitCursor=True)`. This made the application look busy while it was actually waiting for the user.

slicer.util.messageBox() now temporarily removes all override cursors while the message box is displayed and restores them afterwards, using the new private `_temporaryNormalCursor()` context manager. This fixes the cursor in all message boxes raised via infoDisplay, warningDisplay, errorDisplay, confirmOkCancelDisplay, confirmYesNoDisplay, and confirmRetryCloseDisplay.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `721f929254f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.