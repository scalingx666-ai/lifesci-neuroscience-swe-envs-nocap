# Issue

**Title:** Fixes to let OpenSesame work with Qt 5.6

## Description

Qt 5.6 no longer includes QtWebKit in its binaries. This module has been replaced with QtWebEngine. The OpenSesame webbrowser module now uses QtWebEngine if it cannot find QtWebKit.

Another fix involves adding a check for **name** == "**main**" in the main opensesame module, which is a strict requirement for multiprocessing under Windows or other platforms that lack os.fork() functionality (see https://docs.python.org/2/library/multiprocessing.html#windows).

Finally, there is a small fix in the font checking, that otherwise caused a crash on OSX.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77af17f9bab4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.