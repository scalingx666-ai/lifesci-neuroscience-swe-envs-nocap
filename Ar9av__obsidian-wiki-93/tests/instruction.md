# Issue

**Title:** fix(stop-hook): fire at most once per session via session_id sentinel

## Description

## Summary

- Extracts `session_id` from the Stop hook payload
- Derives a sentinel path `$TMPDIR/wiki-stop-capture-<session_id>.done`
- If the sentinel exists → exits 0 (already nudged this session, no-op)
- On first trigger → creates the sentinel, then emits the nudge (exit 2)
- Falls back gracefully when `session_id` is absent (no sentinel, old behavior)

This is Option B from #91. Chosen over Option A (checkpoint mtime) because it's fully self-contained in the hook — no cross-file dependency that can break on future skill renames (as happened with #82).

## Test plan

- [ ] New session → make ≥1 edit → Stop → nudge fires once ✓
- [ ] Continue session → make more edits → Stop again → silent (sentinel present) ✓
- [ ] New session (new session_id) → sentinel is absent → nudge fires again ✓
- [ ] Tested on st3ve remote sandbox

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `240d6e78c907`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.