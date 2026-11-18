# Issue

**Title:** fix(web): grow GoT trace "Next tasks" bubbles to fit wrapped titles

## Description

## Summary

In the GoT / reasoning-trace detail pane (`TraceNodeDetail`), the **后续任务 / Next tasks** field renders each child node as a rounded "bubble" (`<button>`). Long child titles wrapped onto multiple lines, but the bubble kept a **fixed `height: 24px`**, so the wrapped lines spilled outside the pill border and overlapped adjacent bubbles/rows.

## Related Issues

## Changes

`packages/web/src/styles/global.css` — `.trace-detail__children button`:
- `height: 24px` → `min-height: 24px` (pill grows with wrapped text)
- `padding: 0 8px` → `padding: 3px 10px` (vertical breathing room for multi-line)
- added `line-height: 1.4`, `text-align: left`
- added `white-space: normal` + `overflow-wrap: anywhere` (long unbroken tokens wrap instead of overflowing horizontally)
- `border-radius: 999px` → `12px` (single-line stays a full pill since 12px = half the 24px height; multi-line reads as a clean rounded rect)

Shared by both the live GoT view (`AgentTraceViews.tsx`) and the demo trace-node modal (`TraceNodeModal.tsx`).

## Type of Change

- [x] Bug fix (non-breaking change that fixes an issue)

## Verification

### How to test

1. Open a session with task decomposition; go to the GoT / Trace view.
2. Select a node whose children have long titles (full-sentence or long CJK titles).
3. Inspect the **后续任务 / Next tasks** field — bubbles now grow to enclose the wrapped text; short bubbles are unchanged.

### What you personally verified

Rendered the **real** `tokens.css` + `global.css` cascade in headless Chromium with mixed short / long-EN / long-CJK / unbreakable-token titles and measured every bubble (`clientHeight` vs `scrollHeight`, `clientWidth` vs `scrollWidth`):

- **Before:** long bubbles `scrollHeight` 24–26px > `clientHeight` 22px → vertical overflow (text escapes the pill).
- **After:** long bubbles grow (`clientH == scrollH` = 52 / 68px), unbreakable token wraps with no horizontal overflow, short bubbles stay at 22px. **0 overflowing bubbles.**

Not verified: appearance under every custom theme (change is layout-only; colors untouched).

### Checks

- [x] `BP_MOCK=1 npx vitest run` passes (web: 22 files / 174 tests)
- [x] Web build passes (`cd packages/web && npm test && npm run build`)
- [x] Manually tested locally (headless-Chromium render + measurement, before/after)
- [x] Screenshots / recordings attached (if UI changes)

**Before / After** (long CJK, long EN, and unbreakable-token titles):

Before — wrapped text overflows the fixed-height pill; only the first line sits inside the border.
After — each pill grows to enclose all wrapped lines; short pills unchanged.

## Checklist

- [x] This PR is AI-assisted, and I have self-reviewed the generated code (see CONTRIBUTING.md)
- [x] My code follows the project's style
- [x] I have performed a self-review
- [x] I have added/updated documentation as needed (n/a — CSS-only)
- [x] My changes do not introduce new warnings

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98cad095ae7c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.