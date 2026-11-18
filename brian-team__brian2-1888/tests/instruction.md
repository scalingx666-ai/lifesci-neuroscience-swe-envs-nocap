# Issue

**Title:** Add VS Code task to run the test suite

## Description

This PR adds a VS Code task for running Brian's test suite and makes it the default test task, so you can kick it off with **Tasks: Run Test Task** from the Command Palette. Following your comment in #1790, it goes through `dev/tools/run_tests.py` instead of calling `pytest` directly. I also added a sentence to `.devcontainer/README.md` so people know it's there.

One thing to flag: `.vscode/` was in `.gitignore`, so I changed that to `.vscode/*` plus `!.vscode/tasks.json`. That way only the shared task file gets tracked, and everyone's personal VS Code settings stay out of the repo. If you'd rather handle this differently, just let me know.

For testing, I ran it in the devcontainer and all 4 test suites passed (numpy: 304 passed in about 1.5 min, cython: 301 passed in about 8.5 min). I also tried it outside the container with the project's `.venv` selected in VS Code, and it picked up the right environment there too.

The task currently calls plain `python`, which means it assumes Brian is installed in whatever environment is active. That's always the case in the devcontainer, but it's worth knowing. The alternative would be `${command:python.interpreterPath}`, which always uses the interpreter selected in VS Code but depends on the Python extension being installed. I went with the simpler option, but I'm happy to switch if you think the other one makes more sense.

Part of #1828.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24bcf811fbcb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.