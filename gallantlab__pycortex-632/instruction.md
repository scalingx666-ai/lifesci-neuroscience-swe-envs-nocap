# Issue

**Title:** FIX VertexRGB/VolumeRGB alpha attenuation in WebGL viewer

## Description

## Summary

. The WebGL fragment shader composites with a premultiplied-alpha *"over"* formula:

```glsl
gl_FragColor = vColor + (1.0 - vColor.a) * gl_FragColor;
```

…but `VertexRGB.vertices` / `VolumeRGB.volume` ship raw, non-premultiplied RGB bytes. With α < 1 this rendered vertices brighter / clipped toward white instead of blending toward the curvature underlay.

**Fix (Python-side, narrow):** premultiply RGB by α at the WebGL serialization step (`cortex/webgl/data.py` `Package.__init__`). The `.vertices` / `.volume` properties stay non-premultiplied so the matplotlib (`quickshow`) path keeps using matplotlib's straight-alpha `imshow` compositor unchanged. Both viewers now produce the same composite `α·rgb + (1-α)·bg`.

**Important:** the premultiplication only applies to **VertexRGB**, not VolumeRGB. VolumeRGB ships through the PNG texture path (`cortex/webgl/resources/js/dataset.js:335-338`), where Three.js sets `tex.premultiplyAlpha = true` and WebGL's `UNPACK_PREMULTIPLY_ALPHA_WEBGL` already premultiplies the texture once on upload. Premultiplying again on the Python side would double-attenuate partial-alpha VolumeRGB. VertexRGB has no equivalent JS-side step (vertex attributes via `BufferAttribute`), so it still needs the Python premult.

This is the *Python-side* option suggested in the issue — narrower than touching the shader (which would also affect other dataviews and require broader regression checks).

Also deprecates `BrainData.blend_curvature` (`Vertex.blend_curvature` / `VertexRGB.blend_curvature` / `Vertex2D.blend_curvature` via inherited references): it was a hack to mimic transparency for `Vertex` objects, no longer needed now that per-vertex α works directly in both viewers.

## Companion fix: 2D-cmap LUT texture (commit [`0eafd8c`](../commit/0eafd8c5))

While verifying the headless A/B against `quickshow`, we noticed that the *2D dataview* path (`Vertex2D` / `Volume2D` with alpha-encoding 2D colormaps such as `RdBu_r_alpha`) still didn't match — WebGL panels rendered noticeably brighter / less attenuated than the matplotlib reference, while RGB dataviews matched after the Python fix above.

**Why the Python-side premultiplication doesn't reach this path.** `Vertex2D.uniques()` yields dim1 and dim2 as separate scalar maps, so `Package.__init__` ships them as plain floats with no alpha channel — there's nothing for the Python code to premultiply. The actual LUT lookup happens on the GPU in the vertex shader at [`shaderlib.js:755`](cortex/webgl/resources/js/shaderlib.js#L755):

```glsl
vColor = texture2D(colormap, cuv);  // cuv = (data_norm, alpha_norm)
```

The fragment shader then runs the same premultiplied-over composite (`vColor + (1-α)·bg`). For that to produce the correct result, the *colormap texture itself* needs to be uploaded premultiplied — but the cmap texture in `mriview.js` was created with `tex.premultiplyAlpha = false`. Empirically, this leaves brain-region pixels at median R≈129 (out of an unattenuated 167 LSB ceiling) instead of the correct ~93.

**Fix (one-line, JS-side).** [`cortex/webgl/resources/js/mriview.js:33`](cortex/webgl/resources/js/mriview.js#L33) now sets `tex.premultiplyAlpha = true` on the cmap textures, matching the existing convention for the per-vertex / volumetric texture path. For non-alpha colormaps (every row α=255), premultiplication is a no-op, so the change has no effect on existing colormaps. For alpha-bearing colormaps, the LUT texel `(R, G, B, α)` becomes `(α·R, α·G, α·B, α)` on upload, and the fragment shader's `vColor + (1-α)·bg` then correctly resolves to `α·rgb + (1-α)·bg`. Verified live (the user confirmed both viewers now match across all four patterns in `examples/datasets/plot_data_with_alpha.py`).

## Equivalence with quickshow (matplotlib)

For VertexRGB, verified analytically and via test:
- WebGL shader, with premultiplied bytes:  `vColor + (1-α)·bg = (α·rgb) + (1-α)·bg`
- matplotlib `imshow` layered over curvature, with non-premultiplied bytes:  `α·rgb + (1-α)·bg`

`test_quickshow_webgl_alpha_equivalence` (in `test_quickflat.py`) pins this equivalence at the per-vertex level for arbitrary curvature gray, with tolerance ≤ 2/255 (uint8 rounding).

For Vertex2D / Volume2D the equivalence is empirical: with `tex.premultiplyAlpha = true` on the cmap texture, the WebGL composite numerically matches the quickshow render against the same alpha-bearing 2D colormap, side-by-side across the four patterns in the new gallery example (volumetric / surface, scalar+α / RGB+α).

## Tests added

- `cortex/tests/test_webgl_data.py` *(new)* — Package serialization unit tests:
  - VertexRGB: serialized bytes are α-premultiplied (general α, α=1 passthrough, α=0 zeroes RGB).
  - VolumeRGB: serialized bytes are **NOT** premultiplied (Three.js will do it once on texture upload).
  - sanity checks that `.vertices` stays non-premultiplied (so quickshow keeps working).
- `test_quickflat.py::test_quickshow_webgl_alpha_equivalence` — asserts WebGL and matplotlib paths agree per-vertex against arbitrary curvature.
- `test_quickflat.py::test_make_flatmap_image_vertexrgb_alpha_unchanged` — guards the matplotlib path from accidental premultiplication regressions.
- `test_webgl_headless.py::test_vertexrgb_alpha_zero_renders_curvature_only` — playwright pixel-level regression: with α=0 over the whole brain, expects ≪500 red-dominant pixels. Verified to **fail** without the fix and **pass** with it.
- `test_webgl_headless.py::test_volumergb_alpha_half_renders_correct_blend` — playwright pixel-level regression for the VolumeRGB double-premult risk: uniform red with α=0.5 should produce median R ≈150 (correct), not ≈100 (double-premult). Verified to fail when Python-side premult is wrongly extended to VolumeRGB.
- `test_webgl_headless.py::test_vertex2d_alpha_half_renders_correct_blend` *(new)* — playwright pixel-level regression for the cmap-LUT premult fix. Renders `Vertex2D(data=+1, alpha=0.5, cmap=RdBu_r_alpha)` and asserts the brain region's median R is ≈93 (correct) rather than ≈129 (buggy un-premultiplied LUT). Verified to fail in the buggy state and pass with the fix.
- `test_dataset.py::test_blend_curvature` — wrapped existing assertions in `pytest.warns(DeprecationWarning)`.

Full suite: `pytest cortex/tests/test_dataset.py cortex/tests/test_webgl_data.py cortex/tests/test_quickflat.py cortex/tests/test_webgl_headless.py` → **80 passed, 1 xfailed** (the xfail is pre-existing).

## Before / After screenshots

Reproducer: uniform red `VertexRGB` over the flatmap, with α=0 inside V1+V2+V3.

| | result |
|--|--|
| **Before** | V1+V2+V3 region renders as bright pink/red — bug: shader's `vColor + (1-α)·bg` clips RGB toward white when fed non-premultiplied bytes. |
| **After** | V1+V2+V3 region falls through to the gray curvature underlay — correct `α·rgb + (1-α)·bg` composite. |

<details><summary>Before/after</summary>
<p>
Before
<img width="1024" height="768" alt="before" src="https://github.com/user-attachments/assets/9df1df57-d9b4-42e5-8f12-a0b90e28ec61" />

After
<img width="1024" height="768" alt="after" src="https://github.com/user-attachments/assets/642e4cfa-ed7f-482c-9f1c-1729571283a9" />

</p>
</details>

## Test plan

- [x] `pytest cortex/tests/test_dataset.py cortex/tests/test_webgl_data.py cortex/tests/test_quickflat.py cortex/tests/test_webgl_headless.py` — 80 passed.
- [x] Headless regression for VertexRGB (α=0 falls through to curvature) — passes; verified to fail when fix is reverted.
- [x] Headless regression for VolumeRGB (α=0.5 blends correctly, not double-attenuated) — passes; verified to fail when Python premult is wrongly extended to VolumeRGB.
- [x] Headless regression for Vertex2D (α=0.5 with `RdBu_r_alpha` blends correctly) — passes; verified to fail when `mriview.js` cmap `premultiplyAlpha` is reverted to `false`.
- [x] `test_datatype_renders[VertexRGB|VolumeRGB]` — still passing (no regression in baseline RGBA rendering).
- [x] Visual: the issue's MRE renders V1 as half-transparent (washed-out gray) instead of bright/clipped.
- [x] Quickshow (`cortex.quickshow`) output of the same MRE remains byte-for-byte identical to pre-patch.
- [x] Live-viewer A/B: across all four patterns in `examples/datasets/plot_data_with_alpha.py` (Volume2D, Vertex2D, VolumeRGB, VertexRGB), the WebGL render now matches the corresponding `quickshow` render.

## Files explicitly NOT modified

- `cortex/dataset/viewRGB.py` — `vertices`/`volume` properties stay non-premultiplied so the matplotlib path keeps working.
- `cortex/webgl/resources/js/shaderlib.js` — no shader change, avoiding the larger surface area of regression checks.
- `cortex/webgl/resources/js/dataset.js` — no JS change; the existing `tex.premultiplyAlpha = true` already does the right thing for VolumeRGB.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c050bb32417`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.