# Issue

**Title:** Fix plot pixeltype

## Description

This allows for pixeltypes to be converted to float for plotting.

## Related issues
- Not addressed here: #189 (`plot()` errors on an empty overlay) is a separate bug in the overlay windowing code.

## Summary
`plot()` failed for any non-float image, and for any overlay that isn't float, such as the common `plot(img, img > 100)`:

```r
img <- antsImageRead(getANTsRData("r16"))
plot(img, img > 100)
#> Error: input images must have float pixeltype
plot(antsImageClone(img, "unsigned char"))
#> Error: input images must have float pixeltype
```

`plot.antsImage()` crops the image and each overlay with `cropImage()`, which only accepted float images.

### Changes
- `cropImage()`, `cropIndices()`, `decropImage()` and `extractSlice()` now cast their inputs to float for the ANTsRCore call. They cast the result back to the input pixeltype, as ANTsPy's `crop_image` does. Float inputs give exactly the same results as before.
- `plot.antsImage()` required `misc3d` but never uses it, only `pixmap`. When `misc3d` was missing it printed a message and returned without plotting. It now only requires `pixmap`, and errors if that is missing instead of silently doing nothing.

## Tests
Adds `tests/testthat/test-plot_crop.R` (17 expectations, all passing):
- The crop functions on `unsigned char`, `unsigned int` and `double` images, checking that the pixeltype is kept and the values match the float path.
- `plot()` with an integer image and with a mask overlay.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `059f86fcc168`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.