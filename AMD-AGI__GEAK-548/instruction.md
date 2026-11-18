# Issue

**Title:** fix(run_e2e): Recover a no-win AgentX run and classify an unreachable model API

## Description

.

**No-gain recovery.** `_recover_completed_no_gain` read the baseline from `output_throughput_tok_s_median`, which is null on AgentX's total and interactivity axes, so a no-win AgentX run that timed out came back as `{"status": "timeout", "error": ""}`. It now reads `throughput_tok_s_median` (the selected metric basis) first and recovers `no_gain`; a summary that predates that field still falls back to the alias. A timeout's `error` now names the budget that ran out, and a result with no workflow return records `phase_reached` (`setup`, `search`, `finalize` or `validate`).

**Unreachable model API.** Claude Code turns a failed connection into an `API Error: ...` reply, which reached GEAK's caller as `workflow_parse_error`. `_classify_error` now matches that wording, as Claude Code 2.1.177, 2.1.309 and 2.1.316 print it, and returns `llm_unreachable` with the original message kept. A connection error from a bench or server elsewhere in the transcript does not match, nor does an API error from a server that answered (a 500). The CLI fallback also keeps the stdout tail when stderr is empty.

Two commits, one per problem, with details in each message. Docs: `run-e2e-contract.md` and `run_e2e.md` describe the no-return result and list the new class. Tests: `test_run_e2e_recovery.py`, `test_run_e2e_dispatch.py`.

**Validation.** Replayed a run of each kind the issue describes: the no-win run now recovers `no_gain` at its baseline number, and the `ECONNREFUSED` record is now `llm_unreachable`. Checked end to end with claude-agent-sdk 0.2.176 and Claude Code CLI 2.1.316 / 2.1.177 against a refused endpoint. GEAK's CI steps pass locally, on this branch alone and with #545.

Not covered: the runtime path (`GEAK_AGENT_BACKEND` / profile), and an outage that starts mid-run. Hyperloom does not branch on GEAK's `error_class`, so it needs no change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f4d7fc6a51c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.