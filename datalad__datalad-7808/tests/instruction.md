# Issue

**Title:** BF: Lazy-import requests in ora_remote to avoid chardet 6 warning

## Description

- [x] This is mostly to test if this is really the trigger since I failed to reproduce locally and unclear why stderr in output would deadlock us, but gurus on execution layer (@christian-monch ?) might help to reveal on why...
- So -- somehow preventing stderr output does address that stalling issue!  I failed to reproduce issue locally to troubleshoot/address properly, so I will leave that to others to run into/fix. Meanwhile will merge this workaround to make `maint` healthier again.  The only failing ` ../datalad/core/distributed/tests/test_clone.py::test_gin_cloning` in another run is unrelated

Move `import requests` from top-level to a local import in HTTPRemoteIO.exists() -- the only method that uses it -- and suppress the RequestsDependencyWarning when importing.

requests 2.32 declares support for chardet >=3.0.2, <6.0.0. datalad requires chardet>=3.0.4 with no upper bound, so pip resolves to chardet 6.x.  requests itself depends on charset-normalizer (not chardet), but when both are installed it checks chardet first and emits a RequestsDependencyWarning at import time if the version is outside its declared supported range.

With chardet 6 installed and the top-level import, every git-annex-remote-ora subprocess emits this warning to stderr before the external special remote protocol handshake begins:

  BEFORE (top-level import):
    stdout: VERSION 1
    stderr: .../requests/__init__.py:113: RequestsDependencyWarning:
            urllib3 (2.6.3) or chardet (6.0.0.post1)/charset_normalizer
            (3.4.4) doesn't match a supported version!

  AFTER (lazy import + warning suppression):
    stdout: VERSION 1
    stderr: (empty)

This correlates with the onset of CI stalls on 2025-02-22 when chardet 6.0.0 was released: the 3.12+stalldetection jobs (specifically test_ria_postclonecfg SSH variant on pytest-xdist gw0) began hanging indefinitely while all other jobs completed normally.  The exact mechanism by which the stderr output or chardet 6 causes the hang is not fully established -- git-annex's external special remote protocol uses stdin/stdout and should relay stderr without affecting protocol parsing.  The stalldetection retry loop (abort stalled transfer after 120s, restart remote, retry) may also play a role.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `83b83bb3600a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.