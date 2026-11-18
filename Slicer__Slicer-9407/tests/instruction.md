# Issue

**Title:** BUG: Make close-scene dialog honor "discard modifications" in Qt6

## Description

.

With Qt6, clicking **"Close scene (discard modifications)"** in the *Save before closing scene?* dialog opened the *Save Scene and Unsaved Data* dialog instead of closing the scene.

`confirmCloseScene()` compared the return value of `exec()` against `QMessageBox::AcceptRole`. For custom buttons that value is opaque. In Qt5 it happened to equal the role of the first button, but in Qt6 it doesn't, so "discard" fell into the save path.

Changes:
- Identify the chosen button with `clickedButton()`, as `confirmCloseApplication()` already does after 42ba202c08.
- Allocate the `ctkMessageBox` on the stack instead of using `WA_DeleteOnClose`, so it still exists when `clickedButton()` is read after `exec()`.
- Behavior is otherwise unchanged. Cancel and closing the dialog still abort the close. "Save scene" closes the scene only if the Save Data dialog is completed. "Don't show again" still works, because `ctkMessageBox` replays the choice by clicking the actual button.

## Testing

Tested on macOS 26.6 arm64 with Qt 6.11.2. A GUI script adds an unsaved volume, triggers `FileCloseSceneAction`, clicks each button, and records any modal dialogs that follow:

| Button | before | after |
|---|---|---|
| Close scene (discard modifications) | Save Data dialog opens; scene not closed | scene closed, no Save Data dialog |
| Save scene | Save Data dialog opens | Save Data dialog opens (scene kept when it is cancelled) |
| Cancel | scene kept | scene kept |

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5803a54d5156`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.