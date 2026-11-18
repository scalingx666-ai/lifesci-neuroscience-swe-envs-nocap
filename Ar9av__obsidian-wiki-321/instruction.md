# Issue

**Title:** feat(update): notify on new releases, refresh skills after upgrade, pin plugin to releases

## Description

Users only got updates when they went looking. This makes updates show up on their own.

- **Update notice.** The CLI and the SessionStart hook print one line when PyPI has a newer release. The check is cached and runs at most once a day. It fails silently offline and is off in CI or with `OBSIDIAN_WIKI_NO_UPDATE_CHECK=1`. Adds `obsidian-wiki update-check`.
- **Skills refresh after an upgrade.** The next command re-installs skills only into agent directories setup already populated, in the same symlink or copy mode. Output goes to stderr, so `--json` stays clean.
- **Plugin follows releases.** `plugin.json` now has `version: 2026.11.4`, and `publish.yml` fails any tag that doesn't match it. The docs explain how to turn on marketplace auto-update. This replaces `test_no_pinned_version`: the publish check now covers the forgotten-bump risk that test guarded against.

Tests: `tests/test_update_check.py` (version ordering, daily cache, offline, opt-out, refresh touches only agents that were set up). Full suite passes apart from `test_server`, which needs the optional MCP extra locally and fails the same way on main.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc5e714f52ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.