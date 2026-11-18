# Issue

**Title:** NF: add-archive-content - accept multiple archives in a single invocation

## Description

The `archive` argument now takes one or more archives (or keys with
--key), which are processed in the given order.  Their content is added
within a *single* commit, and a single Python/git-annex session, which is
substantially faster than invoking the command once per archive (locally:
20 archives went from 14s in a loop to 4.3s in a single invocation, and
from 20 commits to 1).

Implementation-wise, all per-archive work moved into a dedicated
`_add_archive_content()` helper (the extraction loop itself is unchanged),
while `__call__` now

- vets all given archives (tracked-ness, existence, annex key) before
  modifying the dataset, so that nothing is added if any of them cannot
  be used,
- sets up the datalad-archives special remote and the archives cache once,
- yields a result record per archive (in addition to the dataset-level
  one),
- commits once at the end, listing all archives in the commit message,
- reports progress across archives whenever more than one is given.

If adding the content of an archive fails, the remaining archives are not
processed and nothing is committed, i.e. the prior behavior for a single
archive is preserved.

Along the way, the temporary directory created for --delete-after is now
addressed relative to the root of the dataset instead of the current
directory, so it no longer leaks when the command is invoked from a
subdirectory (which would now leak one directory per archive).

Addresses

Claude-Session: https://claude.ai/code/session_019tQFYm1tNU6GiGLFdLExAM

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `755752d27582`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.