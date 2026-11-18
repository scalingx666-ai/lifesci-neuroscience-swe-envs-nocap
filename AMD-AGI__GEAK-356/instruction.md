# Issue

**Title:** Replace setup.sh with pip-installable packaging

## Description

Make `pip install "git+https://github.com/AMD-AGI/GEAK"` the one-command install: a build_py hook runs a best-effort bootstrap (clone the repo to $GEAK_HOME + install the Claude Code CLI), and the Python deps install via [project.dependencies]. All metadata + deps now live in pyproject.toml; the old requirements.txt and setup.sh are removed. Re-run or library-only installs are covered by the geak-setup command and GEAK_SKIP_BOOTSTRAP=1.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78fad5d66d6c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.