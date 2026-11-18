# Issue

**Title:** Tolerate noisy preprocess v3 tool context args

## Description

## Summary
- Coerce string/scalar `dispatch_subagent` context values instead of raising when the orchestrator LLM passes non-object context.
- Let `codebase_explore` derive `CODEBASE_CONTEXT.md` from `output_dir` when the LLM passes that instead of `out_path`.
- Prevents post-verifier orchestrator loops after the harness has already been generated, verified, profiled, and COMMANDMENT.md rendered.

## Test plan
- `python3 -m py_compile src/minisweagent/run/preprocess_v3/tools.py`
- Observed the container aiter smoke reach `HARNESS_VERIFIED=true` and write `COMMANDMENT.md`; this patch addresses the noisy tool-argument errors seen after that point.

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1900362eede`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.