# Issue

**Title:** BF: remove undefined _getSvnVersion/_getHgVersion references in info.py

## Description

## Summary

`_getSvnVersion` and `_getHgVersion` were removed in 895f4cbf0 ("PKG: getHgVersion and getSvnVersion no longer useful"), but two loose ends were left behind in `psychopy/info.py`:

- their entries in `__all__`, and
- their call sites in `RunTimeInfo._setExperimentInfo`.

Because the call sites are wrapped in `try/except Exception`, the `NameError` raised by the missing functions has been **silently swallowed** ever since — so the SVN/Mercurial revision capture (`experimentScript.svnRevision`, `experimentScript.hgChangeSet`, …) has been dead code with no observable effect.

`pyflakes psychopy/info.py` reports these as undefined names:

```
psychopy/info.py:13:1: undefined name '_getHgVersion' in __all__
psychopy/info.py:13:1: undefined name '_getSvnVersion' in __all__
psychopy/info.py:276:33: undefined name '_getSvnVersion'
psychopy/info.py:285:27: undefined name '_getHgVersion'
```

## Changes

- Remove the dangling `__all__` entries and the dead SVN/Mercurial blocks, completing the removal started in 895f4cbf0. The other private names in `__all__` (`_getUserNameUID`, `_getHashGitHead`, `_getSha1hexDigest`, `_thisProcess`) remain defined and are kept.
- Add a regression test (`test_all_names_defined`) asserting every name in `info.__all__` resolves, so a future dangling export is caught.

No behaviour change: the removed code never executed successfully.

## Testing

```
python -m pytest psychopy/tests/test_misc/test_info.py -q   # 2 passed
python -m pyflakes psychopy/info.py                         # no undefined-name warnings
```

Found via static analysis; not linked to an existing issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4d550dcd63a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.