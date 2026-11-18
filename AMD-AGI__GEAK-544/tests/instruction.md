# Issue

**Title:** Fix agent wait sleep block that is deprecated in Claude 2.1.310

## Description

Claude Code 2.1.310 extended its long-foreground-sleep block to sessions with telemetry or nonessential traffic disabled, which GEAK runs set. With background tasks on, a Bash call that starts with `sleep N` (N >= 25) is refused and the agent is pointed at Monitor or run_in_background. A workflow agent's turn ending is its return, so that notification lands after the agent is gone. On a 2.1.310 run the director's Validate had its `sleep` refused, armed Monitors, ended its turn, stopped its own legs mid warm-up and returned no verified throughput with ~430min of budget unused.

* run_e2e.py sets CLAUDE_CODE_DISABLE_BACKGROUND_TASKS=1 for the Claude Code child (SDK and CLI paths) and for the runtime path, unless the operator set the variable. That turns the block off; the Workflow tool still runs as a background task and completes as before.
* PROCESS_SAFETY's wait example was `sleep 300; tail -5 run_bench.out`, the form 2.1.310 refuses. It is now a bounded until-loop that checks before it sleeps, with the rules never to start a command with a sleep and never to wait by ending the turn.
* Tests pin the env default, an operator's own value ("0" included), the runtime path, and that no PROCESS_SAFETY example starts with a sleep of 25s or more.

Checked on CLI 2.1.312 / SDK 0.2.174 with a director-style agent that launches two detached 6min legs: with the old preamble and background tasks on, `sleep 300` was refused in both runs and one agent returned "incomplete" after 80s; with this change both runs waited the full legs and returned the measured numbers, with no refused call.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2aa10280642a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.