# Issue

**Title:** Fix quit/save dialog issues on exit

## Description

## Overview

Fixes two problems in the application-exit confirmation flow in `qSlicerMainWindowPrivate::confirmCloseApplication()`. Both were observed on macOS with Qt6, but the first is a platform-independent logic fragility.

## 1. `BUG:` Save-before-exit dialog didn't honor the chosen button

When the scene has unsaved changes, quitting shows a dialog with **Save**, **Exit (discard modifications)**, and **Cancel exit**. The **Save** and **Exit** buttons were both added with `QMessageBox::ActionRole`, and the result was read via `clickedButton()` pointer identity with no default/escape button set. With two same-role buttons the native macOS/Qt6 button layout could return the wrong button, so clicking **Exit** was handled as **Save** and re-opened the Save Data dialog instead of quitting.

- Give each button a distinct role: `AcceptRole` / `DestructiveRole` / `RejectRole`.
- Set the non-destructive **Cancel exit** as the default and escape button.
- Read `clickedButton()` once.
- Also fixes the long-standing `\todo`: choosing **Save** now exits only if the save data dialog was actually completed, instead of a fire-and-forget action trigger that never exited after saving.

## 2. `STYLE:` Suppressed exit dialog flashed on screen

When there are no unsaved changes and the user previously ticked *"Don't show this message again"*, `ctkMessageBox::confirmExit()` still constructs the dialog and suppresses it by briefly realizing it off-screen and auto-clicking on the next event-loop turn. Because `confirmExit()` runs synchronously from `closeEvent` (unlike `disclaimer()`, which defers `exec()` via `singleShot`), the off-screen suppression loses the race with the window server on macOS/Qt6 and the dialog visibly flashes before the app quits.

- Read the `MainWindow/DontConfirmExit` setting directly and skip constructing the dialog when confirmation has been disabled, so exit is immediate and no dialog is ever realized.

## Testing

Built and tested on macOS (Qt6). With a modified scene: **Exit** quits immediately, **Save** saves then quits (or stays open if the save dialog is cancelled), **Cancel exit**/Esc/Return keep the app open. With no unsaved changes and confirmation disabled: Command-Q quits with no flash.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a81a83f7724`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.