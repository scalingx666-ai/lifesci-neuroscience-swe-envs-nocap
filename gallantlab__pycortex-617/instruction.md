# Issue

**Title:** Split 'r' hotkey: fold-only vs full view reset

## Description

The `r` hotkey conflated two distinct operations: folding the brain and resetting camera position — while not even resetting zoom, making it neither a clean fold nor a true reset.

## Changes

- **`r` key** — now only folds the brain (`mix → 0`) without touching camera target, azimuth, altitude, or radius
- **`t` key** (new) — full view reset: folds brain + resets camera to defaults (`target=[0,0,0]`, `azimuth=45°`, `altitude=75°`, `radius=400`)
- **Docs** — updated keyboard shortcut table and Camera Controls section in `docs/userguide/webgl.rst`

## Relevant diff (`mriview.js`)

```js
// r: fold only (no camera movement)
var fold_brain = function() {
    this.animate([{state:'mix', idx:parseFloat(viewopts.anim_speed), value:0}]);
}.bind(this);

// t: full reset
this.reset_view = function() {
    this.animate([
        {state:'camera.target',   idx:parseFloat(viewopts.anim_speed), value:[0,0,0]},
        {state:'camera.azimuth',  idx:parseFloat(viewopts.anim_speed), value:45},
        {state:'camera.altitude', idx:parseFloat(viewopts.anim_speed), value:75},
        {state:'camera.radius',   idx:parseFloat(viewopts.anim_speed), value:400},
        {state:'mix',             idx:parseFloat(viewopts.anim_speed), value:0},
    ]);
}.bind(this);
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a29daad6f6a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.