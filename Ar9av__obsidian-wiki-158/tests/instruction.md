# Issue

**Title:** fix(hooks): exempt read-only sessions from the Stop-hook capture nudge

## Description

# fix(hooks): exempt read-only sessions from the Stop-hook capture nudge

## Problem

The Stop hook nudges `/wiki-capture --quick` when a session has `edits >= 1 OR bash >= 4`. The bash-count arm fires on pure research sessions — e.g. 0 file edits and a run of `gh pr list` / `git log` / `grep` / `cat` commands that only read state. Each false nudge costs a full skill invocation that predictably ends in the KEEP/SKIP gate's SKIP: wasted tokens and an extra turn at every session end.

Observed in practice (2026-08-03): a status-check session with 0 edits and ~30 read-only shell commands (`gh`, `grep`, `python3 -c` parsers) was nudged, and the capture skill correctly skipped — the whole round-trip bought nothing.

## Change

The transcript scan now also classifies each `Bash` command as read-only or mutating:

- **Quote-aware pipeline splitting** — segments split on `| || && ; \n`, but never inside quotes, so `python3 -c "…; print(…)"` stays one command.
- **Redirect detection** — an unquoted `>` marks the segment mutating; `2>&1` and `/dev/null` redirects stay harmless; `>` inside a quoted argument is ignored.
- **Command awareness** — an allowlist of never-mutating commands, plus subcommand/flag checks for `git` (status/log/diff/show/…), `gh` (view/list/status/diff/checks), `sed` (`-i` → mutating), `python`/`python3` (`-c`/`-V` only), and `curl` (write/data/upload flags or non-GET `-X` → mutating). Wrappers (`sudo`, `time`, `xargs`, `timeout`, env assignments) are stripped first.
- **Conservative default** — anything the classifier can't prove read-only counts as mutating, so behavior for such sessions is exactly as before this change.

New trigger:

| Session shape | Before | After |
|---|---|---|
| ≥ 1 file edit | nudge | nudge (unchanged) |
| 0 edits, ≥ 4 bash, ≥ 1 mutating | nudge | nudge (unchanged) |
| 0 edits, ≥ 4 bash, all read-only | nudge → SKIP | **silent exit 0** |

This doubles as a cheap pre-gate: the SKIP decision for research sessions now happens inside the hook for free, instead of costing a skill turn.

## Not changed

- The sentinel / `stop_hook_active` logic from #151 is untouched (and covered by the new tests).
- The nudge message and exit-code contract (0 silent / 2 stderr) are unchanged.

## Tests

`tests/test_stop_hook_behavior.py` runs the hook against synthetic transcripts with an isolated `TMPDIR` and pins: edit-trigger, read-only exemption, single-mutating-command restore, redirect edges (`> file` vs `2>/dev/null`), git/sed classification, below-threshold silence, sentinel once-per-session, sentinel not burned by quiet turns, and `stop_hook_active` suppression. All 10 fail (2 assertions) against the current hook and pass with the patch; the existing `test_stop_hook_packaging` suite still passes.

## Possible follow-up (out of scope here)

Excluding the vault's `_raw/` writes from the edit counter would keep a session whose only writes are wiki captures from triggering its first nudge. With the once-per-session sentinel it no longer causes loops, so it's left out to keep this change small.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b4e82e3bc414`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.