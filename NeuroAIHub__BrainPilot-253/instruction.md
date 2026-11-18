# Issue

**Title:** fix(web): clear hasPanned on mouseup so trace-graph node clicks survive a pan

## Description

## Repro

1. Open a session with a reasoning-trace graph (GoT panel).
2. Press-and-hold anywhere on the viewport (not on a node) and drag more than ~3px to pan.
3. Release, then try to click any node in the graph.

**Expected:** the node opens (its detail panel is shown).
**Actual:** the click is silently swallowed. Node clicks stay broken for every subsequent click.

Workarounds users have discovered:
- Panning with the horizontal scrollbar at the bottom works — subsequent node clicks fire normally.
- Two-finger touchpad panning works — subsequent node clicks fire normally.
- Only **press-and-drag** on the viewport itself breaks node clicks.

## Root cause

`packages/web/src/components/session/TraceGraphView.tsx` uses a `dragRef.hasPanned` flag to distinguish a pan gesture (whose trailing click on mouseup must be suppressed) from a genuine node click.

The flag is only ever cleared by the viewport's own `onMouseDown` handler (`TraceGraphView.tsx:191`). It is **not** cleared in `onMouseUp` / `onMouseLeave`.

The next time the user clicks a node, that node's `onMouseDown` calls `e.stopPropagation()` (`TraceGraphView.tsx:277`), so the viewport's `onMouseDown` never fires — and `hasPanned` stays `true`. The node's `onClick` then sees `hasPanned === true` (`TraceGraphView.tsx:288`) and returns without calling `onSelectNode`.

Result: after one pan gesture, node clicks are dead until the user happens to click somewhere on the viewport background (which re-triggers viewport `onMouseDown` and clears the flag).

Scrollbar drag and trackpad two-finger scroll don't go through the viewport's synthetic mousedown/mousemove — they're native scroll events — so `hasPanned` never gets set, and node clicks continue to work.

## Fix

Clear `hasPanned` on the next tick after `onMouseUp` / `onMouseLeave`. The next-tick delay preserves the original guard (React's `onClick` fires synchronously right after `mouseup`, so it still sees the stale `true` for the current interaction) while making sure the flag doesn't leak into subsequent interactions.

PR incoming.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e30503f7ef2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.