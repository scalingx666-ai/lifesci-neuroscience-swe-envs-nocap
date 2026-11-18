# Issue

**Title:** BF: Suppress RequestsDependencyWarning from requests

## Description

requests 2.32.x ships a check_compatibility() that asserts chardet < 6, but datalad declares chardet>=3.0.4 with no upper bound.  Modern resolvers (pip, uv) install chardet 7.x, which trips the assertion and emits a RequestsDependencyWarning to stderr on every `import requests`.

The requests main branch already accepts chardet < 8 (PR #7220 and follow-ups), but no release has been cut since Aug 2025, so the warning is purely cosmetic — HTTP functionality works fine.

Add a global warnings.filterwarnings() in datalad/__init__.py to suppress the warning before any transitive `import requests` can fire. This replaces two ad-hoc workarounds:

- datalad/distributed/ora_remote.py: warnings.catch_warnings() block around `import requests` in HTTPRemoteIO.exists()
- datalad/tests/test_installed.py: stderr filtering for RequestsDependencyWarning in test_run_datalad_help

### PR checklist

- [x] Provide an overview of the changes you're making and explain why you're proposing them.
- [x] Create a changelog snippet (add the `CHANGELOG-missing` label to this pull request in order to have a snippet generated from its title;
  or use `scriv create` locally and include the generated file in the pull request, see [scriv](https://scriv.readthedocs.io/)).
- [x] Include `Fixes #NNN` somewhere in the description and `scriv` changelog entry if this PR addresses an existing issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6bc8b5763d20`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.