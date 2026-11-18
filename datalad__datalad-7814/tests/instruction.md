# Issue

**Title:** BF: Fix tox test failures from PWD mismatch and non-UTF-8 encoding

## Description

When tox uses changedir, the subprocess CWD changes but PWD env var is inherited from the parent, causing getpwd() to permanently switch to os.getcwd() mode. This breaks symlink path preservation and CWD recovery, cascading into ~50 test failures.

Add a session-scoped conftest fixture that syncs PWD with os.getcwd() and resets _pwd_mode before tests run.

Also guard 4 tests that pass non-ASCII characters through subprocess args against non-UTF-8 filesystem encodings, using the new FILESYSTEM_SUPPORTS_UTF8 constant. Skip codespell over a few more directories.

### PR checklist

- [x] Provide an overview of the changes you're making and explain why you're proposing them.
- [x] Create a changelog snippet (add the `CHANGELOG-missing` label to this pull request in order to have a snippet generated from its title;
  or use `scriv create` locally and include the generated file in the pull request, see [scriv](https://scriv.readthedocs.io/)).

There is also a slight tune up to codespell ignores

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a618712000f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.