# Issue

**Title:** [MRG] Improve Qt testing suite

## Description

- Use [pytest-qt](http://pytest-qt.readthedocs.org/) plugin: `qtbot` fixture in a test to register a widget, and emulate user actions
- No more hack with Qt tests
- Faster Qt tests
- Exceptions raised during a Qt test make the unit test fail: no more silent Qt fails
- Possibility to use a Qt bot: emulate keystrokes and mouse actions on any Qt view as part of the testing suite
- Fixed bug with snippets on Python 2
- Fixed unicode special character bug with cursor on Python 2 (the cursor is hidden on Python 2)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `374cbfe55b94`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.