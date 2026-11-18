# Issue

**Title:** ENH: Improve Python package install progress dialog

## Description

Extensions often call `pip_install` in quick succession, which makes the dialog nearly impossible to interact with, as each call resets the position, collapsed state, and the the window keeps appearing and disappearing.

This commit changes the pip install progress dialog (_PipProgressDialog) so that installs performed in quick succession appear in a single, stable window:
- Reuse one dialog instance with a deferred hide, so back-to-back installs no longer flash the window closed and open between calls.
- Show the log as one continuous stream across consecutive installs, with a divider between them. Clear it only after the dialog has been idle for a while.
- Preserve the dialog position, size, and scroll position, scroll state, details section collapsed state between installs.

Other minor improvements:
- Auto-scroll: when the end of the log is visible then keep showing the last log lines. Stop auto-scroll when the user scrolls up and resume when return to the bottom.
- Restore popup size when collapsing details section.

Before:

https://github.com/user-attachments/assets/b1690563-66ca-4b03-ae80-ac32111dea3c

After:

https://github.com/user-attachments/assets/87c8cc33-4f39-48b5-9650-6e2635f0deb6

Tested using this script:

```
import slicer, qt

# Obscure, small, pure-Python packages — none are Slicer/pip dependencies,
# so reinstalling them is safe.
packages = [
    "tabulate", "termcolor", "humanize", "more-itertools", "cachetools",
    "decorator", "toml", "inflection", "shortuuid", "emoji",
    "pyfiglet", "cowsay", "parse", "isodate", "natsort",
]

for i, pkg in enumerate(packages):
    slicer.util.pip_uninstall(pkg)

for i, pkg in enumerate(packages):
    slicer.util.pip_install(pkg)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `63ae0815e689`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.