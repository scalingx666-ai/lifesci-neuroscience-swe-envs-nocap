# Issue

**Title:** BF: Reload config after enableremote in create-sibling-ria

## Description

## Summary

- 

- `create-sibling-ria --existing reconfigure` fails with `[ERROR] expected str, bytes or os.PathLike object, not NoneType` on first run, succeeds on second run
- **Root cause**: When `--existing reconfigure` is used and the special remote already exists, `init_remote()` fails and the code falls back to raw `call_annex(['enableremote', ...])`, which (unlike `init_remote()` and `enable_remote()`) does not call `config.reload()`. The subsequent `ds.config.get("remote.{}.annex-uuid")` returns `None`, causing the TypeError when passed to `gr.config.add()`
- **Fix**: Add `ds.config.reload()` before reading the UUID to ensure the config reflects the on-disk state regardless of which code path was taken

## Test plan

- [x] Red/green verified: pytest datalad/distributed/tests/test_create_sibling_ria.py::test_create_simple fails without the fix, passes with it
- [x] Manual test  

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e37108d8398`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.