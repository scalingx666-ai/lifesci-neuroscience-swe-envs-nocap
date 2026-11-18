# Issue

**Title:** fix(e2e_workflow): free the GPUs for the final phase and the caller

## Description

## Summary

A long run that measured a real win could still hand its caller nothing usable. Two causes, one commit each:

- **The required checkpoint commit was cut off at the final-reserve boundary** (commit 1). `requireE2EValidationCheckpoint` aborts the workflow when the commit is missing, and its writer copies and hashes the replay assets, which takes 4-8 min. Dispatched at the boundary, the writer got the boundary's 2 min floor, so the run aborted before Finalize, Report and Validate with its win uncommitted. The commit now gets `max(agentTimeoutFor(), min(AGENT_TIMEOUT_MS, 30 min))`, passed at that one call site through a `timeoutFor` parameter on `persistE2EValidationCheckpoint`, `safeAgent` and `agentBounded`. Every other agent keeps `agentTimeoutFor()`.
- **Finalize, Validate and the caller measured on GPUs the search still held** (commit 2). The reserve boundary abandons a search agent's promise, not the agent, and whatever it launched detached (`setsid nohup`) kept running: a tuner sweep, an A/B leg, a script waiting to start the next one. New `e2e_workflow/scripts/run_reaper.py` stops what belongs to the run: processes carrying the run's marker (`GEAK_E2E_RUN_MARK`, set by `run_e2e.py` before the workflow starts and inherited by everything under it), or started after the run with a command line or working directory inside its eval dir, together with their descendants. It never selects PID 1, itself or its ancestors, never matches by name, and re-checks each pid's start time before signalling it. It runs as a fence ahead of Finalize and Validate, on its own 10 min bound, and again when `run_e2e.py` exits, after `result.json` is written. TuningSkillset, which runs for hours under one agent, starts only with `tuning_min_window_s` (default 6h, `0` disables) left before the final reserve.

## What a run now shows

- `[final-phase fence] finalize: stopped N process(es) still running from the search (...)`, and the same for `validate`, in the workflow log; `$EVAL_DIR/.final_phase_fence` and `$EVAL_DIR/logs/run_reaper.jsonl` record what was stopped.
- `[run_e2e] exit: stopped N process(es) this run left running (...)` on the runner's stderr, after `result.json`.
- `[time-budget] TuningSkillset SKIPPED — ~Nmin left before the final reserve, under the 360min the tuning loop needs ...` when the tuning window is short.
- One more PROCESS SAFETY rule for agents: once `.final_phase_fence` exists the search is over; unless it is the e2e_integrator finalizing or the director validating, an agent starts nothing more on the GPUs (no server, leg, tuner or profiler), does not relaunch what was stopped, and returns what it already has.

## Evidence

Hyperloom with GEAK on GLM-5.2 MXFP4, 8x MI355X (TP8), AgentX trace replay (393 entries, concurrency 10), GEAK knowledge-base recall on. Times are UTC.

- **Oct 14, GEAK main.** The accepted-stack checkpoint commit started where the 6h final reserve began, got 2 min and was cut off; the workflow aborted before Validate, and a +36.4% search A/B never reached the caller.
- **Oct 16, without commit 2.** TuningSkillset started at 16:23:43, 2h11m before Finalize began, and its agent ran until 23:49:17: through Finalize (18:34-20:16) and Validate (20:36-23:59). GEAK returned at 00:27 with a recovered +38.7% candidate; Hyperloom's re-measurement started at 00:27:20 and SGLang refused to boot: `RuntimeError: The memory capacity is unbalanced. Some GPUs may be occupied by other processes.` The session closed at 0.00% validated gain.
- **Oct 17-18, with both commits.** The accepted-stack checkpoint commit took 6m22s (06:10:34-06:16:56); the same commit took 6m45s on Oct 16. Then:

| UTC, Oct 18 | Record | Stopped | Still up |
|---|---|---|---|
| 06:16:59 | fence before Finalize | 300, all on SIGTERM: an SGLang server and 273 processes under it holding the GPUs; 21 holding the serving-GPU lock (2 `bench_e2e.sh`, 18 `aiperf`, `flock`); 5 detached scripts, among them the A/B a search agent had started 17 s earlier | 0 |
| 07:22:42 | fence before Validate | 0 | 0 |
| 09:58:19 | `run_e2e.py` exit | 296, all on SIGTERM: Director validation's leg (`run_director_validate.sh`, `bench_e2e.sh`, an SGLang server with 273 processes under it, 18 `aiperf`), still benchmarking at the deadline | 0 |

  Hyperloom's re-measurement started about 35 s after the exit and validated +43.71% (P50 interactivity 133.9 to 192.5 tok/s per user). TuningSkillset did not run in this session.

## Test plan

- The `CI L0 - checks` workflow's own steps, run job by job on a fresh clone with this PR's files, on Python 3.11 and Node 20 as the workflow pins them: every blocking step passes. Unit tests: 3111 passed, 6 skipped; coverage 97.09%, gate passes. bash syntax, expert-skill static validation, KB and workflow contract checks, gitleaks, all 16 node regressions, the vendored tuning-skillset verify and the dry-run mapping pass.
- New tests: `e2e_workflow/scripts/tests/test_run_reaper.py` (21 tests: selection, path matching, and stopping real process trees, including detached, orphaned and marker-less GPU workers, a recycled pid and a process older than the run); `interface/test_run_e2e_recovery.py` (+3: the exit stops a detached leg only after `result.json` is written, a failing cleanup never costs the result, the Claude child inherits the run mark); `test_final_phase_gpu_handover.js` (28 checks: the tuning window and the fence placement) and `test_time_budget_reserve.js` (+15 checks: the checkpoint bound).
- Commit 1 alone passes `node --check e2e_workflow/e2e_workflow.js` and `test_time_budget_reserve.js`.
- Ruff (advisory in CI, 0.17.1 with the repository's configuration): +6 findings in the touched files, each a pattern the same file already uses: EXE001 for a shebang on a non-executable script (44 of the 50 with a shebang under `e2e_workflow/scripts/`), BLE001 for the reaper calls in `run_e2e.py` (the file has 26) and one in `run_reaper.py`, RUF059 for an unused `rc` in two new recovery tests (the file has 5).

## Notes for review

- Two commits so each fix reads alone; commit 2 uses commit 1's `timeoutFor` parameter for the fence's 10 min bound.
- `tuning_min_window_s` is a new workflow argument. The 6h default comes from the tuning loop taking about 5h on a large model; `0` restores the old behaviour.
- `StopTest.setUp` in `test_run_reaper.py` resets SIGTERM to its default. `run_e2e._emit` ignores SIGTERM on purpose while it writes `result.json`, an ignored disposition survives `exec`, and CI runs `test_run_e2e_recovery.py` earlier in the same pytest process, so without the reset the test's own child processes could not receive the reaper's SIGTERM.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9af7c5895970`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.