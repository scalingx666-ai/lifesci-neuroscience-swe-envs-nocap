# Issue

**Title:** Prepare for release of PyNWB 4.2.0 (take two)

## Description

Re-cut of 4.2.0 after the first tag failed to publish.

- Release date set to September 2, 2026.
- Three changelog entries now link the PR that made the change rather than the issue it closed (#2237, #2248, #2250), matching the rest of the file.
- `actions/setup-python` v6 → v7 and `astral-sh/ruff-action` v3 → v4. setup-python v7 drops the `pip-install` input, which no workflow here uses; ruff-action v4 moves to node24, which affects self-hosted runners only. Every other action already references its latest major.

Checklist notes: all 15 PRs merged since 4.1.0 are represented in the changelog; the `awk` extraction yields 25 non-empty lines of release notes; the `nwb-schema` submodule is at the 2.11.0 tag; legal dates already read 2017-2026. Local tests and docs were not run, CI covers them.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ddcbee32e2e1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.