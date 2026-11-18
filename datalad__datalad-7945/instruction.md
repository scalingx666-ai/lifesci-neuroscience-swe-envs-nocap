# Issue

**Title:** BF: stop background git maintenance racing tests; rotree/rmtree tolerate vanishing files

## Description

`test_ro_operations` kept failing on the NFS job (4 of 5 runs across the last heads of #7930), always with:

```
chmod: cannot access '.../clone/.git/objects/maintenance.lock': No such file or directory
```

**Cause:** `repo2.fetch()` spawns `git maintenance run --auto`. Since git 2.47 ("Maintenance tasks other than 'gc' now properly go background", per its release notes) that process detaches, and the runners have 2.55. It creates and removes `.git/objects/maintenance.lock` while the test's `chmod -R a+rX` walks the clone. Nothing about this is specific to NFS; that job is just where the timing lines up. More in

### Changes

- **`datalad/conftest.py`:** add `maintenance.auto=false` to the suite-wide `GIT_CONFIG_PARAMETERS`, so no test races a background maintenance run.
- **`rotree`:** it checked `exists()`, then called `stat()` and `chmod()`, so a file vanishing in between raised `FileNotFoundError`. It now ignores `FileNotFoundError` from stat/chmod, which also covers the broken symlinks the `exists()` check was there for. `rmtree` calls `rotree` first, so it was affected too.
- **`rmtree`:** passes `shutil.rmtree` an error handler that ignores `FileNotFoundError` (`onexc` on ≥ 3.12, `onerror` before), unless the caller supplies their own. Python ≥ 3.13 already does this itself; on older versions the whole removal went through a `try_multiple_dec` retry after a sleep.
- **New test `test_rotree_rmtree_vanishing_file`** (`ai_generated`): without the fix it fails in both helpers (`FileNotFoundError` from `rotree`, a retry and sleep in `rmtree`). With the fix it passes on Python 3.10–3.13, both as root and non-root.

### Verification

These results come from runs with CI trimmed by since-dropped `TEMP:` commits:

- `test_ro_operations` on NFS, in 7 runs of the scoped NFS job: it got past `chmod` every time and then skipped at its later `sudo chown` step, as root cannot chown on that export. Before this change `chmod` failed in 4 of 5 runs.
- The generic job, the NFS job and the Windows job covering `datalad.tests` all passed, and the new test passed on Windows and NFS.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_015n8PHTQEunuRbDDkoM83dt

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `409404917eb5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.