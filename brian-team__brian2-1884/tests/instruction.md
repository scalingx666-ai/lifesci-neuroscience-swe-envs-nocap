# Issue

**Title:** Remove obsolete Python linting/formatting settings from devcontainer

## Description

This removes the 11 `python.linting.*` and `python.formatting.*` settings from `.devcontainer/devcontainer.json`, and fixes a filename in `.devcontainer/README.md`: it said `frozen_dependencies.txt`, but the file written by `postCreateCommand` (and ignored in `.gitignore`) is `frozen-requirements.txt`.

The Python extension no longer supports these settings. Inside the container, its `package.json` lists 0 `python.linting` or `python.formatting` settings, so these lines did nothing. They were left over after 192e5bb switched the devcontainer to ruff and removed the flake8 extension, and they made it look like flake8 was still in use, while the pre-commit hooks use ruff.

I rebuilt the container with this change (about 74 s) and checked that ruff 0.14.2 is installed and that format-on-save still reformats python files with ruff.

Part of #1828.

Building the container also creates an untracked `.devcontainer/devcontainer-lock.json` (from the `github-cli` feature). Should it be committed, or added to `.gitignore`? I'm happy to do either.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a2988610fe4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.