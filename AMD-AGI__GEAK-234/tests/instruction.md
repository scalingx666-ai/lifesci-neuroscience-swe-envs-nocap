# Issue

**Title:** Fix v3 preprocess sandboxing and context compatibility

## Description

## Summary
- Bring over the non-scheduler fixes from `gwiab-scheduler` for Docker subagent packaging, subprocess sandbox path rewriting, and Path-A COMMANDMENT setup.
- Add v3 preprocess sandboxing so harness subagents operate in an isolated repo copy/worktree instead of mutating the original repo.
- Restore legacy-compatible preprocess context fields (`harness_path`, `test_command`, baseline text, `path_taken`) for downstream postprocess consumers.

## Test plan
- `python3 -m pytest tests/run/test_preprocess_v3_bugfixes.py`
- `python3 -m py_compile src/minisweagent/run/preprocess_v3/adapter.py src/minisweagent/run/preprocess_v3/tools.py src/minisweagent/run/preprocess_v3/subagent.py src/minisweagent/tools/str_replace_editor.py tests/run/test_preprocess_v3_bugfixes.py`
- Container E2E smoke: `topk` completed with exit code 0 and produced `final_report.json`.
- Container E2E smoke: `silu` completed with exit code 0 and produced `final_report.json`.

## Notes
- This intentionally avoids the scheduler/GPUManager commits from `gwiab-scheduler`.
- Postprocess binary/cumulative patch apply robustness is still separate follow-up work.

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de28cf3a59ce`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.