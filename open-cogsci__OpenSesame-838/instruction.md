# Issue

**Title:** Fix help extension/plugin command in embedded browser

## Description

## Problem

The `help extension <name>` and `help plugin <name>` commands in the embedded browser are broken. In `Webbrowser.command()`, the `folder` variable is assigned with `==` instead of `=`, so the comparison result is discarded and `folder` is never defined. The following `os.path.join(folder, ...)` then raises `NameError`, so neither command can open the corresponding help file.

## Solution

Change the two comparisons to assignments in `libqtopensesame/widgets/webbrowser.py`. The plugin branch assigns `self.plugin_manager[cmd[2]].folder`; the extension branch assigns `self.extension_manager[cmd[2]].extension_folder`, since built extensions expose the folder through that property (their `folder` is a deprecated method, not a path). `folder` is then used to build the path to the help file.

## Test plan

- [x] `ruff check --select B015` no longer flags the lines
- [x] `python -m py_compile libqtopensesame/widgets/webbrowser.py` passes
- [x] `pytest tests/test_compilable.py tests/test_syntax.py` passes
- [x] Manually verify `help extension <name>` / `help plugin <name>` opens the help file in the embedded browser

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5b2479d55699`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.