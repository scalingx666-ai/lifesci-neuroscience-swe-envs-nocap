# Issue

**Title:** BF: Avoid use of return in a finally block

## Description

This PR removes a use of `return` in a `finally` block.

Before:

```console
$ uv sync -p3.14
$ uv run python -c 'import datalad'
/var/home/chris/Projects/datalad/datalad/utils.py:1978: SyntaxWarning: 'return' in a 'finally' block
  return
```

After:

```console
$ uv sync -p3.14
$ uv run python -c 'import datalad'
```

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b884cf2af405`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.