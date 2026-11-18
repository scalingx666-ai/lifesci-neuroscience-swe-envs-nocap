# Issue

**Title:** fix(hooks): claim Stop-hook sentinel atomically to survive duplicate registration

## Description

## Problem

The `wiki-stop-capture.sh` "fire at most once per session" guard is a check-then-write with the two halves separated by the whole script:

```bash
[[ -f "$SENTINEL" ]] && exit 0     # near the top
# ...transcript parsing...
: > "$SENTINEL"                    # only just before exit 2
```

Claude Code **merges** project-level and user-level hook config rather than letting one override the other, and runs matching hooks **concurrently**. Since this repo ships its own `.claude/settings.json` registering the Stop hook, following `wiki-setup`'s instructions to *also* install it globally means two invocations run in parallel for the same `session_id`. Both pass the existence test before either performs the write, so the guard never fires.

Observed in practice — a single session end produced two nudges:

```
[bash /Users/…/obsidian-wiki/.claude/hooks/wiki-stop-capture.sh]: Session ended with 43 file edit(s)…
[bash .claude/hooks/wiki-stop-capture.sh]: Session ended with 43 file edit(s)…
```

(one from the absolute-path global registration, one from the relative-path project registration)

## Fix

Claim the sentinel with `mkdir`, which is atomic on POSIX filesystems — exactly one invocation wins, the losers `exit 0` silently. No lockfile or `flock` dependency.

Two placement details matter and are easy to get wrong:

1. **The claim stays at the decision point**, not at the top of the script. Claiming early would burn the session's single nudge on an early below-threshold turn, silencing a later turn that did meaningful work.
2. **The cheap short-circuit check moves `-f` → `-e`**, since the sentinel is now a directory. Left as `-f` it would silently stop matching.

The early check is kept purely to skip transcript parsing; it is explicitly *not* the correctness guarantee, and the comment now says so.

## Verification

Six cases, all passing against the patched script:

| Case | Expected | Result |
|---|---|---|
| Two **concurrent** invocations, same `session_id` | one nudge | exit `2` + `0`, **1 nudge** ✅ |
| Below-threshold turn, then a work turn | still nudges | exit `0` then `2` ✅ |
| Sequential re-fire after a nudge | suppressed | exit `0` ✅ |
| `stop_hook_active` re-entry guard | suppressed | exit `0` ✅ |
| Missing `session_id` (no dedup possible) | still nudges | exit `2` ✅ |
| Legacy **file**-shaped sentinel from an in-flight session | honored | exit `0` ✅ |

`bash -n` clean.

## Docs

`wiki-setup/SKILL.md` step 3 previously warned only about not clobbering an existing `hooks.Stop` array. Added a note that the duplicate registration inside this repo is expected, that the atomic sentinel means it now yields a single nudge, and that both entries should be left in place — removing the project one dirties a tracked framework file and disables capture for anyone who clones without doing the global install.

## Notes

The general rule generalizes beyond this hook: **anything that must happen once per session needs an atomic claim, because Claude Code hooks run concurrently.** Any future `SessionStart`/`SessionEnd` hook in this repo with a once-per-session guard would hit the same class of bug.

No README changes, so translation parity is unaffected.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `073a04cd3796`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.