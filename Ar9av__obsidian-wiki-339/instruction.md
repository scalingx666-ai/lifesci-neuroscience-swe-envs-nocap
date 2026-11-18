# Issue

**Title:** feat(costs): cost per job, recorded from agent runs, reported against output

## Description

Scheduled agent runs (the daily update, a weekly review, a nightly ingest) cost money every time they fire. Nothing recorded how much, or whether a run produced anything. The rule this supports: **if a job costs more than it earns, fix it or kill it.**

**What changes**
- **`obsidian-wiki costs record JOB [key=value ...]`** appends a `COST job=<VERB> cost_usd=… tokens_in=… tokens_out=… duration_s=… turns=…` line to `log.md`. The figures come from:
  - `--from-json FILE|-`: a `claude -p --output-format json` result (`total_cost_usd`, `usage` with cache reads and writes counted as input, `duration_ms`, `num_turns`, and `is_error` recorded as `error=<subtype>`), or JSON/JSONL events carrying `usage` objects (Anthropic or OpenAI field names);
  - or `--cost-usd`, `--tokens-in`, `--tokens-out` and `--duration-s`, which override the JSON.
- **`obsidian-wiki costs report [--since 30d] [--max-cost-per-output X] [--fail-on-flagged]`** joins COST lines with each job's own log lines in the window. Per job it gives runs, spend, cost per run, tokens, time, output (`pages_created` + `pages_updated` + `pages_written` + `staged` + `promoted` + `todos_added`) and cost per output. Flags are `no_output`, `over_budget` and `errors`. Jobs with no recorded cost show `-` and are never estimated. `--fail-on-flagged` exits 2 when anything is flagged.
- **`wiki-status` costs mode** ("what is the wiki costing me", "cost per job"): renders the report and recommends fix or stop for each flagged job. It never changes a schedule itself.
- Routing row in `AGENTS.md`, plus `docs/skills.md` and a new *Cost per job* section in `docs/cli.md`.

**Tests**
- `tests/test_costs.py`: 10 tests.
  - Parses a **real** `claude -p --output-format json` result. I captured it once from a capped Haiku call (about $0.005), stripped the session ids, and saved it as a fixture.
  - Also covers error results, JSONL usage events (both field-name styles), and unreadable input.
  - COST line formatting and validation (including rejecting a non-verb job name).
  - The full join: window cut-off, output fields, cost on a job's own line, COST-only jobs, errors, never-priced jobs, totals, ordering and flags.
  - The over-budget threshold, an empty log, window parsing, and the CLI (record from a file and stdin, flag override, JSON report, the `--fail-on-flagged` exit code, errors).
- Also ran under Python 3.9 (as in CI): passed.
- Full suite: 1332 passed, 4 skipped (`CI=true`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b26cca60480f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.