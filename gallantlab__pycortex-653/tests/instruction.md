# Issue

**Title:** webgl: fix overlay/label async texture-bake races (complete)

## Description

## Problem

On the WebGL `make_static` viewers, the ROI / sulci / label overlay controls misbehave: a toggle often doesn't take effect until you next move the brain, and rapid toggling can leave the overlay disagreeing with the checkbox state. This is the long-standing overlay-toggle bug.

Two earlier fixes (#643 generation guard, #644 redraw-on-bake) were merged and then **both reverted** (#645, #646) — because #644 alone forced a redraw *before* asynchronously-loaded **label** textures were ready, producing persistent **black-square labels** on load (seen on chen-2024). This PR is the complete fix that also handles the label path.

## Root cause — three intertwined async bugs

1. **Out-of-order overlay bakes.** `SVGOverlay.update()` re-bakes the overlay into a GPU texture asynchronously (`toDataURL → Image.onload → dispatch "update"`) with no sequencing guard, so the last bake to *resolve* (not the last *requested*) wins.
2. **No redraw on commit.** `addSurf` never wired the surface's own `"update"` to `Viewer.schedule()`, so a committed overlay texture isn't drawn until the next interaction.
3. **Label texture built from an unloaded image.** `Labels.set_tex` created the glyph `THREE.Texture` from an `Image` whose `src` had just been set (not yet loaded) → an empty GPU upload (the black squares) → and never scheduled a redraw when it finally loaded. This is exactly what made #644 regress.

## Fix

- **(1)** Generation-id guard in `SVGOverlay.update()`; stale bakes are discarded. Stray `console.log("Updating overlay!")` removed.
- **(2)** `surf.addEventListener("update", this.schedule.bind(this))` in `addSurf`.
- **(3)** `Labels.set_tex` now builds the glyph texture inside `img.onload`, then dispatches `"update"`. `Labels` is made an `EventDispatcher`, and each layer's label `"update"` is routed via **`this.surf.dispatchEvent({type:"update"})`** → `Viewer.schedule()`.

Routing the label redraw through the **surface's own `"update"`** (the redraw channel) rather than the overlay-texture channel means `uniforms.overlay.value` is never touched — so no `mriview_surface.js` change is needed and there's no clobber/re-bake loop.

`node --check` passes on both files.

## Verification

Browser-verified against a real make_static viewer (`viewer-stories-group`, a target named in #643): patched the inline JS in `viewer.html` and confirmed — single toggles take effect immediately, rapid toggling always settles on the checkbox state, labels render as text (no black squares) and appear on first enable, and the console no longer logs on every overlay update. Recommend a quick re-check in-browser before merge.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2cc730989cdf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.