# Issue

**Title:** Check arguments before slow work so bad inputs fail fast

## Description

## Summary

Several argument checks only ran **after** expensive work, so a bad argument failed minutes (or, for registration and fMRI preprocessing, much longer) into a run. This moves them to the start, or repeats them there, so bad inputs fail immediately.

To find them, I scanned every function for `stop()` / `stopifnot()` / `.stopIfNA()` calls that come after the first call to an expensive function (registration, bias correction, motion correction, `timeseries2matrix`, filtering, image reading, random forests and so on), and triaged each one by hand. Checks that need the expensive result, such as the image or data having been read, are left where they are.

| Function | Checked late, after… | Now checked first |
|---|---|---|
| `labelImageRegistration` | the label loop and the **linear (landmark) registration stage** | `typeOfDeformableTransform` (list spec, string, `so`/`bo` subtype) and the `initialTransforms` files |
| `preprocessfMRI`, `preprocessRestingBOLD` | **motion correction, CompCor and frequency filtering** (the end of the function) | `spatialSmoothingType` / `spatialSmoothingParameters`, via a new `.checkSpatialSmoothing()` with the same messages |
| `multiResRandomForestRegression` | building **every feature matrix** | the `randomForest` package requirement |
| `filterfMRIforNetworkAnalysis` | **frequency filtering** | labels without a mask, and the `nuisancein` NA, row-count and numeric checks |
| `functionalLungSegmentation` | **N4 bias correction** | `clusterCenters` vs `numberOfClusters` |
| `fMRINormalization` | reading and processing the first run | the `extraRuns` type and the `abind` requirement |
| `generateAifMaskImage`, `compcor` | `timeseries2matrix` | the `index` / `highvarmatinds` NA checks (from #468) |
| `plot.antsImage` | resampling the overlays | the `pixmap` requirement and the `domainImageMap` structure |
| `antsAverageImages` | reading the first image | the `weights` length |

`aslAveraging` was a false positive in the scan: the flagged call is inside a nested helper. Its method check now also gives "Unrecognized method." for a vector `method`, which used to fail with "condition has length > 1".

The existing later checks are left in place. They're now redundant but harmless.

## Tests
`tests/testthat/test-fail-fast.R` (10 tests) replaces each function's expensive step with a stand-in that errors with "expensive step was reached". A test passes only if the argument error comes first. **Run against the previous code, those tests fail with "expensive step was reached"**, so they catch late checks.

Locally, the full suite passes (252 tests, 0 failures), as do the examples of every changed function.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `99fec4fa48ce`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.