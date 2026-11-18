# Issue

**Title:** fix: Add type annotations, fix a bug in loading schema path

## Description

Adding type checking in  we found that some bidsschematools modules we were using were under-annotated.

This adds annotations for the main schema API and the utilities module.

Two bugs were caught by `mypy`:

* `bst.utils.get_bundled_schema_path` called a non-existent function to get the schema path
* A few functions would not handle non-`Path` path-likes well.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `953e550d9e34`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.