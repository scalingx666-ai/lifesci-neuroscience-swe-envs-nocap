# Issue

**Title:** webgl: fix ROI/sulci/label overlay toggles racing the texture bake

## Description

## Problem

On the WebGL `make_static` viewers (e.g. `viewer-stories-group`, `viewer-chen-2026`), the ROI-boundary / sulci / label switches often fail to take effect — the rendered overlay disagrees with the checkbox state. It's intermittent and feels like a buffering issue.

## Root cause

The overlay layers are SVG `display_layer`s. Each switch calls `Overlay.show()/hide()`, which flips the layer's `display` style and dispatches `"update"`, driving `SVGOverlay.prototype.update()`. That re-bakes the **whole** overlay into a GPU texture **asynchronously**:

```
svg.toDataURL("image/png", …) → new Image() → img.onload → new THREE.Texture → dispatch("update", {texture})
```

and the viewer commits whatever arrives:

```
this.uniforms.overlay.value = evt.texture;   // last to RESOLVE wins
```

There was no sequencing guard. Toggling layers in quick succession starts several bakes concurrently; they can resolve **out of order**, so the last bake to *finish* — not the last one *requested* — is left on the GPU. The overlay then drifts out of sync with the switches.

## Fix

Tag each bake with a per-`SVGOverlay` generation id and discard any bake whose generation is stale, so only the most recent toggle's texture is ever committed. Also removes a stray `console.log("Updating overlay!")` that fired on every update.

7 insertions, 1 deletion; no behavior change other than correctness. `node --check` passes.

## Verification

Repro: open a viewer, rapidly toggle ROIs / sulci / labels — before, the picture frequently lands on a state that doesn't match the boxes; after, it always settles on the current switch state. Re-baking each affected viewer via the `pycortex-roidraw` `reengine.py` tooling propagates the fix into the deployed exports.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6fe15c30e324`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.