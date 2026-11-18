# Issue

**Title:** webgl: redraw when the SVG overlay finishes its async texture bake

## Description

## Problem

. Even with the out-of-order race fixed, a single ROI/sulci/label toggle often still doesn't appear until you next move the brain.

`SVGOverlay.update()` re-bakes the overlay texture **asynchronously**; on completion the surface swaps it into `uniforms.overlay.value` and dispatches `"update"` on itself (`mriview_surface.js:295`). But `addSurf` only wires the surface's `mix`/`allowTilt` and the *dataview's* `update` — **never the surface's own `"update"` to `schedule()`**. So the texture swap lands with no redraw. The menu calls `schedule()` immediately on toggle, which races and usually beats the async bake, drawing the **old** texture; the corrected texture then sits unused until the next interaction.

## Fix

```js
surf.addEventListener("update", this.schedule.bind(this));
```

in `addSurf`, so the overlay redraws the moment its rebaked texture is committed. Together with #643's generation guard, a single toggle now deterministically settles on the current switch state. One line; `node --check` passes.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2c64b0bd0639`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.