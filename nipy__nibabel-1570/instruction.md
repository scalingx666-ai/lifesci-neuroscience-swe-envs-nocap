# Issue

**Title:** chore(deps): Bump minimum dependencies, test on py315,

## Description

* Test on Python 3.15
* Drop 3.10 support
* Bump scientific python dependencies based on #803
* Bump pins in `.pre-commit.yaml`, `uv.lock` and `.github/workflows/*.yml`

Note that cibuildwheel has stopped building 3.13t wheels. It's not worth trying to test 3.13t if new releases aren't supporting it. If someone can't upgrade to 3.14, they probably aren't using free-threading.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f7c14298ab8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.