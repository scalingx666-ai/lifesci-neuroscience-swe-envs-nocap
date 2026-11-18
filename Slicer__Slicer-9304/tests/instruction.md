# Issue

**Title:** BUG: Apply pending layout when the layout manager is enabled

## Description

At startup the main window disables the layout manager so that detached viewports do not appear before the main window, and enables it from the first show event. However, setEnabled(true) only set the flag: layout node modifications that arrived while the layout manager was disabled were ignored, and the subsequent refresh() call re-applies only the CTK layout document, which was never populated. Whether the views appeared therefore depended on whether some layout node modification happened to arrive after the first show event.

With Qt 6 the startup event ordering shifted so that the last layout notification consistently lands before the first show event, leaving the view area of the main window empty until the user manually switched to a different layout.

Diagnosed on a live session by inspecting the layout manager state through the WebServer module's exec endpoint: the view widgets existed but were not visible, the view arrangement was never applied, and a single MRMLLayoutNode->Modified() call healed the session, proving the update chain worked but was never triggered.

Fix by re-applying the current layout node state when the layout manager transitions from disabled to enabled. The existing guards still apply (nothing happens without a scene or during batch processing, and the batch-end observation covers that case).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2c4c53aaa487`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.