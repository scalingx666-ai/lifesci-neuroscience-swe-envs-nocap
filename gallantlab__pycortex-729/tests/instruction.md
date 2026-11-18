# Issue

**Title:** CI: install uv and narrow the Claude workflow allowlist

## Description

PR #728 added `Bash(uv:*)` to the Claude workflow's `--allowed-tools`, but the runner never had uv installed and the pattern was far too broad: `uv run <anything>` and `uv pip install` are arbitrary code execution in a workflow with `CLAUDE_CODE_OAUTH_TOKEN` in scope.

## Allowlist

- Replaced `Bash(uv:*)` with explicit entries that fix the executed program inside the matched prefix: `pytest`, `python -m pytest`, `uv run pytest`, `uv run python -m pytest`, plus read-only `uv pip list` / `uv pip show` / `uv --version`.
- Disallowed `WebFetch`/`WebSearch`: issue and PR text is untrusted input, and network fetches are the easiest exfiltration channel for a prompt-injected session.

## uv install

- `astral-sh/setup-uv` pinned to the exact release tag (it publishes no floating major tag past v7); dependabot keeps it updated.
- `UV_SYSTEM_PYTHON`, `UV_NO_SYNC`, and `UV_PROJECT_ENVIRONMENT` make `uv run` execute in the environment the workflow installs instead of re-resolving the project (there is no `uv.lock`).

## Workflow hardening

- Author-association pre-filter on the job `if:`, so `@claude` mentions from non-members fail in seconds instead of after the multi-minute environment setup. `assigned` issue events are exempt (assigning already requires triage access). This is a cost filter, not the security boundary — claude-code-action still independently verifies the actor has write access.
- `timeout-minutes: 30` (default was 6 hours).
- `concurrency` group per issue/PR, so extra `@claude` mentions queue instead of running in parallel.
- `persist-credentials: false` on checkout, so `GITHUB_TOKEN` isn't left in `.git/config` where code executed by pytest could read it.

Known residual: allowing pytest at all lets Claude execute the checked-out branch's `conftest.py`. That's inherent to running the test suite and predates #728.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3779f7cacad1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.