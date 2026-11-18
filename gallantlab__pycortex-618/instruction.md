# Issue

**Title:** Disable flatmap tilt by default; respect allow_tilt checkbox in controls

## Description

The `allow_tilt` checkbox only toggled a shader uniform but never gated the actual mouse controls. Shift+drag and middle-drag on flatmaps always tilted regardless of the checkbox state.

### Changes

- **`movement.js`**: Add `allowTilt` property (default `false`) to `LandscapeControls`. When false and `mix == 1`:
  - `update()`: shift/middle-drag dispatches to `pan` instead of `rotate`
  - `setAltitude()`: clamps to 0.1° (flat-on)
  - `setAzimuth()`: locks to 180° (flat-on)
- **`mriview_surface.js`**: Replace direct uniform setter with `setAllowTilt()` that sets the uniform and dispatches an `allowTilt` event
- **`mriview.js`**: Wire `allowTilt` event from surface to controls (same pattern as `mix` event)
- **`defaults.cfg`**: Add `allow_tilt = false` to `[webgl_viewopts]`

When `allow_tilt` is checked, the original tilt behavior is fully restored.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a29daad6f6a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.