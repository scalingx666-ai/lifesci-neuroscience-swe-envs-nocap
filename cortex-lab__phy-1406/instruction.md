# Issue

**Title:** Sort numeric text columns by value in the cluster tables

## Description

Sorting the Cluster View by the channel column `ch` orders channels as text rather than as numbers, so a single-digit channel lands in the wrong place relative to a two-digit one. Ascending order comes out as 1, 10, 2, 21, 3 instead of 1, 2, 3, 10, 21.

The cause is that `ch` holds a channel label, and `TemplateController.get_best_channel_label` formats it with `f'{ch}'`, so the value stored in the table is a string. `_TableProxyModel.lessThan` compares raw values with `<`, which for two strings is a character by character comparison. Every column whose values arrive as text has the same problem, not just `ch`.

This adds `_text_sort_key`, used by `lessThan` when either side is a string. Entries that parse as numbers sort first and in numeric order, and the remaining entries keep their existing string ordering, so a mixed column such as a label column stays predictable. Non-string values keep the previous exact comparison path, so integer and float columns are unaffected.

Verified headlessly against a table holding the channel labels 2, 10, 1, 21, 3. Before the change the ascending order was `['1', '10', '2', '21', '3']`, after it is `['1', '2', '3', '10', '21']`. Two regression tests were added to `phy/gui/tests/test_widgets.py`, one for a purely numeric text column and one for a column mixing numbers and free text. Both fail on master and pass with the fix. `make lint`, `make format-check`, and `pytest phy/gui/tests/test_widgets.py phy/cluster/tests/test_supervisor.py` all pass, 106 tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5e26d744ef9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.