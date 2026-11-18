# Issue

**Title:** BUG: Fix combo box signals that were changed to currentTextChanged for Qt6

## Description

Sequence nodes were renamed over and over while browsing a sequence with the Sequences module open: `4D flow` became `4D flow sequence sequence sequence ... [time=984.644ms]`, one more ` sequence` per browsed frame.

Root cause: bdc4f048da (`BUG: Fix Qt6 QComboBox signal: currentIndexChanged -> currentTextChanged`) replaced the Qt5-only `QComboBox::currentIndexChanged(QString)` signal with `currentTextChanged`. The two signals are not equivalent:

| Situation | `currentIndexChanged(int)` | `currentTextChanged`, Qt 5.15 | `currentTextChanged`, Qt 6 |
|---|---|---|---|
| Index changes, different text | emitted | emitted | emitted |
| Index changes, same text | emitted | emitted | **not emitted** |
| Current item's data changes (rename, icon, tooltip) | not emitted | **emitted**, even if the text is identical | emitted if the text differs |

In `qMRMLNodeComboBox` this meant that renaming the current node emitted `currentNodeChanged`. The Sequences module widget reacts to a proxy node selector change by renaming the sequence node to `<proxy base name> sequence`, and the sequence browser renames the proxy node (appending the index value) on every frame change, so each browsed frame appended another ` sequence`.

## Fix

1. **Sequence node name growing by " sequence"** (`qMRMLNodeComboBox`, `qSlicerSequencesModuleWidget`)
   - `qMRMLNodeComboBox` emits `currentNodeChanged` on `currentIndexChanged(int)` (available in Qt5 and Qt6), so renaming the current node no longer emits the signal.
   - `qSlicerSequencesModuleWidget::onProxyNodeChanged` ignores selector changes that do not actually change the proxy node of the sequence.

2. **Slot connections from bdc4f048da** (data dialog, Python/Appearance/Views settings panels, Markups display node widget, Segmentations settings panel)
   - These combo boxes have static items with distinct texts, so the difference did not result in incorrect behavior, but under Qt6 an index change to an item with the same text would be missed. The connections to slots now use `currentIndexChanged(int)`; the slots take the item index and get the item text from the combo box (`onFileTypeChanged`, `onConsoleLogLevelChanged`, `onStyleChanged`, `onMSAAChanged`, `onGlyphTypeComboBoxChanged`, new `onDefaultOverwriteModeChanged`).
   - `onConsoleLogLevelChanged` and `onMSAAChanged` now also emit the corresponding panel signal, replacing the second connection from the combo box to the signal.
   - Connections directly to public signals that take the text (Views panel) and to `setSliceOrientation` of the slice controller, slice information and Reformat widgets are unchanged.

3. **Segmentations default overwrite mode setting not applied until restart** (found while testing change 2)
   - The panel passed the translated item text (`Overwrite visible`) to `setDefaultOverwriteMode`, which expects the mode name stored in the item data (`OverwriteVisibleSegments`). The conversion failed, an error was logged, and the setting only took effect at the next startup, where the item data is used. The new slot passes the item data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d32f6cdabd5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.