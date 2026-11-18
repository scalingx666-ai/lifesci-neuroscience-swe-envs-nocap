# Issue

**Title:** fix(daily-update): normalize naive last_updated to UTC before stale comparison

## Description

## What broke

`stale_count` in `scripts/daily-update.sh` crashes with `TypeError: can't compare offset-naive and offset-aware datetimes` when `.manifest.json`'s `last_updated` has no timezone offset. `datetime.now().isoformat()` produces this format: `2026-06-13T04:27:28`.

`mtime` is always UTC-aware. `last_updated` is only aware when the stored string carries an offset. The `try/except` guards the parse, not the comparison, so a naive value reaches `mtime > last_updated` and throws, killing the daily run and any launchd/systemd job that wraps it.

## Fix

One line after `fromisoformat`:

```python
if last_updated.tzinfo is None:
    last_updated = last_updated.replace(tzinfo=timezone.utc)
```

Already-aware timestamps pass through unchanged. Naive ones get assumed UTC, matching `mtime`'s reference frame.

## Reproduce

```bash
# Set last_updated in .manifest.json to a naive timestamp
# "last_updated": "2026-06-13T04:27:28"
# Then run:
scripts/daily-update.sh
# Before: TypeError crash
# After: correct stale count
```

. Sibling of #35/#36 (relative path skipping in the same block, merged in `aa264a4`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9e85b62b4013`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.