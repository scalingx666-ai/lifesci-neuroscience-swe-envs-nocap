# Issue

**Title:** BF: remove undefined _getSvnVersion/_getHgVersion references in info.py (backport of #7688)

## Description

Backport of #7688, which merged to `dev` on 2026-06-27. The defect is still live on `release`.

Cherry-pick of 1da44cdc4 — applies cleanly, and both files are now byte-identical to their versions on `dev`.

### What was broken

`_getSvnVersion` and `_getHgVersion` were removed in 895f4cbf0 ("PKG: getHgVersion and getSvnVersion no longer useful"), but their entries in `__all__` and their call sites in `RunTimeInfo` were left behind. Two consequences on `release` today:

- `from psychopy.info import *` raises `AttributeError`, because `__all__` names two symbols that do not exist.
- The svn/hg revision capture in `RunTimeInfo` has been dead ever since. The call sites are wrapped in `try/except Exception`, so the `NameError` was silently swallowed — `experimentScript.svnRevision` and `experimentScript.hgChangeSet` have simply never been recorded.

This removes the dangling `__all__` entries and the dead svn/hg blocks, finishing the removal that 895f4cbf0 started.

### Verification

The cherry-pick brings a regression test asserting every name in `info.__all__` resolves. Confirmed it is red before the fix and green after — with the new test in place but `info.py` reverted to its current `release` state:

```
AssertionError: names in __all__ are undefined: ['_getHgVersion', '_getSvnVersion']
1 failed
```

and on this branch:

```
psychopy/tests/test_misc/test_info.py .. 2 passed
```

---

Co-authored by Claude Opus 5.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `994523dd0917`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.