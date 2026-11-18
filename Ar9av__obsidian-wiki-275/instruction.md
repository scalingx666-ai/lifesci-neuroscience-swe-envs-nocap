# Issue

**Title:** chore(security): pin workflow actions, add dependabot and SECURITY.md

## Description

## Why

Prep for listing obsidian-wiki in [awesome-ai-plugins](https://github.com/hashgraph-online/awesome-ai-plugins). That catalog runs a **required** centralized scan gated at **score ≥ 80** (`fail_on_severity: high`). This repo scored **70/100** — no critical or high findings, just operational hygiene that is worth having regardless of the listing.

```
uvx plugin-scanner scan .   # 70/100 (C) -> 88/100 (B)
```

## Changes

- **Pin all 14 third-party action uses to commit SHAs**, release tag kept as a trailing comment. Every SHA is the commit the floating tag already resolved to (verified via the GitHub API), so **no action changes behaviour** — `pypa/gh-action-pypi-publish@release/v1` and `v1.14.2` are literally the same commit. This matters most in `publish.yml`, which carries `id-token: write` for PyPI trusted publishing: a mutable tag could otherwise silently change the code that mints that credential.
- **`.github/dependabot.yml`** (github-actions + pip, monthly). Pinning without Dependabot is just never updating; this bumps the SHA and the `# vX.Y.Z` comment together.
- **`SECURITY.md`** — private advisory reporting, plus a threat model scoped to the actual risk surface: ingesting a vault, document, or session you do not control (vault-path escapes, secrets leaking into pages/exports, `serve` reachable off-loopback). Explicitly out of scope: your own agent doing what you told it to.

## Deliberately not fixed

Two findings remain (both medium, neither blocks the gate):

1. **`version` missing from `.claude-plugin/plugin.json`.** I added it, then found `test_claude_plugin.py::test_no_pinned_version` asserting it must be absent — omitting it is an intentional decision, because without a version Claude Code keys the install on the git commit so `marketplace update` delivers every change on `main`. Reverted; the scanner is wrong for this repo. Costs 5 points.
2. **`vault/competitors/openai-codex.md` trips `RISKY_APPROVAL_DEFAULT`.** It is a competitor note describing Codex's sandbox and approval model in prose, not shipped configuration. Noted in SECURITY.md so a future reader does not "fix" the note.

## Verification

- `uvx plugin-scanner scan .` → 88/100, `critical:0, high:0`
- All 5 workflow files and `dependabot.yml` parse as YAML
- Full suite: 1153 passed, 4 skipped (`tests/test_server.py` excluded — stale local `mcp` install, unrelated and also failing on `main`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0254ca9ea0dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.