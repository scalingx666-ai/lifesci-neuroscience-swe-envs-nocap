# Issue

**Title:** fix(stop-hook): skip already-captured work via mtime checkpoint

## Description

.

## What changed

- **`.claude/hooks/wiki-stop-capture.sh`** — before counting tool uses, reads `~/.obsidian-wiki/capture-checkpoint` mtime as a cutoff. Transcript entries with `timestamp ≤ mtime` are skipped. If no checkpoint exists, all entries are counted (existing behavior preserved).

- **`.skills/wiki-quick-chat-capture/SKILL.md`** — adds a final instruction to `touch ~/.obsidian-wiki/capture-checkpoint` after confirming staged files (or SKIP). This resets the window so the next hook trigger only sees work done since the capture.

## Behavior

| Scenario | Before | After |
|---|---|---|
| First trigger in session | fires correctly | fires correctly |
| After capture, no new work | re-fires with same count | silent (exit 0) |
| After capture, 2 more edits | re-fires with full count | fires with count=2 only |
| New session (old checkpoint) | N/A | all entries counted (checkpoint older than session) |

## Test

```
=== Before checkpoint (should trigger) ===
exit=2 | Session ended with 11 file edit(s) and 53 shell call(s). ...

=== After checkpoint (touch now) ===
exit=0 | <silent>
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a25fd0bbde56`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.