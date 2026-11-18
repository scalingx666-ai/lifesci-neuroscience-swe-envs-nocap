# Issue

**Title:** fix(postprocess): strip binary patches and recapture baseline for format parity

## Description

## Summary

- **Binary patch stripping**: Diff sections containing `GIT binary patch` (compiled binaries, object files) are now unconditionally stripped from patches before `git apply` in eval worktrees. Previously, extensionless compiled binaries leaked through `strip_generated_helper_sections()` and caused patch-apply failures in planned/mixed modes.
- **Baseline recapture**: New `recapture_commandment_baseline()` runs SETUP+FULL_BENCHMARK on the unpatched repo after preflight, overwriting preprocessed baseline files so baseline and candidate outputs use the exact same format. Fixes config-mismatch rejections when the preprocessing harness produces fewer shapes than the COMMANDMENT benchmark section.
- **Scaffolding**: `GEAK_PIPELINE_MODE` env override for mode selection, case-insensitive COMMANDMENT section matching, `agent_name` on `AgentConfig`, eval-worktree recovery on stale registrations.

## Test plan

- [x] 827 unit tests pass (2 pre-existing env-specific skips)
- [x] Import and functional tests for `_section_is_binary()` and `recapture_commandment_baseline()`
- [x] Verified `recapture_commandment_baseline` produces correct 5-shape baseline in live HIP run
- [ ] End-to-end batch validation (planned/mixed/fixed × triton+HIP) running now

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `894060a4949a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.