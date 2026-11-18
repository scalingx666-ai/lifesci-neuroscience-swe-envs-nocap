# Issue

**Title:** BF: run: do not fail on
  untracked output dir containing only empty subdirs

## Description

`_unlock_or_remove()` in `datalad/core/local/run.py` swallowed unlock's "File unknown to git" error only for a completely empty output directory (added for #7653). Git does not track directories at all, so a directory holding only empty subdirectories is just as unknown to git, but it failed the `not os.listdir(...)` check, and `datalad run` aborted before running the command. This is the normal situation when driving `datalad run` from snakemake, which creates the parent directories of declared outputs before executing a job.

The check now tests for the absence of files recursively (`os.walk`) instead of for an empty listing.

Behavior is unchanged for an untracked output directory that does contain files. This can only reach this code under `--explicit`, which skips the dirty check, and it still errors as before. I kept that out of scope: dropping the check entirely would silently change it.

### Changes

- `BF:` relax the empty-directory special case to "contains no files (recursively)", plus a changelog fragment.
- `TST:` extend `test_run_empty_output` with an output directory containing only an empty subdirectory. The test fails with `File unknown to git` before the fix and passes after it. All of `datalad/core/local/tests/test_run.py` passes locally (Linux).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `56fe8c2e81ea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.