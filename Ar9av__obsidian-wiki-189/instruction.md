# Issue

**Title:** fix(cli): stabilize Windows skill setup

## Description

## Summary

- Fix global skill installation when an existing Windows entry is a directory junction.
- Fall back to copied skills only when Windows rejects symlink creation with `WinError 1314`.
- Make CLI status output replacement-safe for GBK PowerShell consoles.
- Add regression coverage for junction replacement, privilege fallback, unrelated symlink errors, and console encoding.

Related: #187, #188

## Root Cause

Windows `Path.is_symlink()` does not identify directory junctions, so the installer previously sent a junction to `shutil.rmtree()`. Standard Windows accounts can also lack the privilege required by `Path.symlink_to()`. Finally, strict GBK stdout encoding caused status icons to abort setup before installation.

## Test Plan

- [x] `python -m pytest -q tests/test_cli_install.py tests/test_ast_extractor.py tests/test_cache.py tests/test_graph_analysis.py tests/test_graphrag.py` (196 passed)
- [x] `python -m py_compile obsidian_wiki/cli.py`
- [x] `git diff --check`
- [x] Ran `obsidian-wiki setup --vault C:\Users\lichen\source\repos\TFX-DMS-Wiki\wiki` on Windows; exit code 0 and 40 skills installed per global agent directory
- [ ] Full suite: existing Windows doctor/environment failures remain outside this change

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `52c9f2bae2fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.