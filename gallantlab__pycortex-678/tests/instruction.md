# Issue

**Title:** FIX bumpy flatmap smoothing skipped on the left hemisphere

## Description

Splits the bug fix out of #310 (which has been sitting since 2019 and no longer merges cleanly).

## The bug

In `mriview_surface.js`, `smoothfactor` and `smoothiter` are declared with `var` inside the `if (this.flatlims !== undefined)` block, but used ~25 lines earlier in the same per-hemisphere loop to smooth `wmareas` and `pialareas`.

`var` hoists the *declaration* to function scope but not the *assignment*, so on the first iteration of the loop they are still `undefined`. `iterativelySmoothVertexData` then runs:

```js
for ( var i = 0; i < undefined; i ++ ) { ... }
```

`0 < undefined` is `false`, so the loop body never executes and the areas come back completely unsmoothed. By the second iteration the values assigned during the first pass are visible, so:

- **left hemisphere** — areas unsmoothed
- **right hemisphere** — areas smoothed with factor 0.1, 50 iterations

which is why the two hemispheres have visibly different bump relief. I confirmed the bug is still present on current `main`.

## The fix

Declare the parameters above the loop, split them into separate constants for the area and distance passes, and reduce the iteration counts (areas 50 → 5, dists 50 → 20) for a somewhat less smoothed result.

The commit adds a comment explaining why the declarations have to live outside the loop, so the bug does not get quietly reintroduced by re-nesting them.

## Note for reviewers

The iteration-count reduction is a deliberate *appearance* change riding along with the correctness fix — it is part of what @alexhuth was going for in #310 ("I also reduced the amount of smoothing somewhat"), but it is separable if you would rather land the hoist alone first. These are also hardcoded constants; they could reasonably be exposed in `[webgl_viewopts]` next to `bumpy_flatmap`.

## Testing

`node --check` passes. Not verified visually — no render was produced.

The lighting half of #310 is split into a separate PR.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `537f05ef4674`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.