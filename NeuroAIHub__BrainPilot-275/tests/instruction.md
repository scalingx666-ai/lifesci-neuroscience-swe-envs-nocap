# Issue

**Title:** feat(demo): draggable dividers between Live Demo panels

## Description

## Overview

The Live Demo player's three parts — **conversation | file preview | reasoning graph + tree** — were a fixed `fr`-based grid. This adds two **draggable vertical dividers** so users can resize the columns to fit whatever they're inspecting (a long transcript, a wide table preview, a big trace graph), with **persistence** and **double-click reset**.

## How it works

- The outer **chat** and **right** panels are px-sized via CSS variables set by `DemoView`; the middle **preview** absorbs the remaining space, so dragging a divider moves only that one boundary.
- Pointer listeners live on `window` (the pointer can leave the thin 6px handle mid-drag), mirroring the existing sidebar-resize pattern in `DesktopShell` / `sidebarResize.ts`.
- Clamping is a pure, unit-tested module (`demoLayout.ts`): outer panels never shrink below a minimum, and the preview keeps its own minimum so a drag can't crush it. When the container width is unknown (pre-layout / headless), only the panel minimum applies.
- **Persistence**: widths are saved to `localStorage` (`demo-panel-widths`) and restored on mount. Writes are guarded on `isResizing`, so a drag stores once on release rather than every frame; malformed / unavailable storage falls back to defaults per field.
- **Double-click a divider** to restore that panel's default width.
- Dividers hide and the layout collapses to a single stacked column under the existing **1100px** responsive breakpoint.

## Tests

- `demoLayout.test.ts` (12 cases): clamping bounds, the preview-minimum cap, tiny-container and unknown-width fallbacks, px rounding, per-edge delta→width mapping, and `parseDemoWidths` persistence (null/empty/invalid JSON, round-trip, rounding, per-field fallback for missing / non-numeric / sub-minimum values).
- Full suite **211/211**; `tsc -b` and `npm run build` pass.

## Scope

Frontend only (`packages/web`). No API/protocol changes. New i18n keys `demo.resize.chat` / `demo.resize.right` / `demo.resize.reset` (zh + en).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d58a7163446`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.