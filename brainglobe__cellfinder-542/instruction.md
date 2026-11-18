# Issue

**Title:** Add consistent parameter docs to the main functions and napari

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Right now we pass the same parameters from napari and to various functions. But these parameters have inconsistent or no docs.

**What does this PR do?**

1. Docs
   1. Adds similarly worded docs for parameters to all main functions, napari, and `setup_filters`.
   2. Makes the docs a bit more complete and readable.
   3. Re-ordered the napari detection parameters order so it flows in the order of how filtering happens. I.e. 2d filtering -> 3d filtering -> cluster splitting.
2. A few parameters (`voxel_sizes`, `n_sds_above_mean_thresh` in napari) was set as ints, but they should be floats.
4. Split parameters
   1. Exposed the `split_` parameters in all the `main` functions, but *not* in napari.
   2. The normal parameters are all in microns, but the `split_` parameters were in pixels. I changed it so it's also in microns by multiplying by the default voxel size. But the default values for the parameters are unchanged.
   3. Exposed `n_splitting_iter` with same default to the `main` functions. Previously it was hard coded in `setup_filters`.
   5. Removed `split_soma_diameter` because it was redundant with `soma_spread_factor` and not used. AFAICT, `soma_diameter` is only used during 2d filtering, not during 3d filtering. *Splitting* only uses 3d filtering. The only place during splitting `split_soma_diameter` would be used is to calculate the volume of a cell to decide whether we need to split it. But, we already have `soma_spread_factor` that multiplies `soma_diameter` not `split_soma_diameter`.
4. Cleaned up `batch_size` into `detection_batch_size` and `classification_batch_size`. The former defaults to `1` in napari and `None` in main. Which means `1` for `GPU` and `4` for `CPU`. The latter default is unchanged.  E.g. on my machine with very large planes, a batch of just 1 detection planes can fit in the 10GB GPU, but 128+ classification cubes can fit.

## References

 and 

## How has this PR been tested?

Locally and with data.

## Is this a breaking change?

Only the `batch_size` parameter name is renamed. Everything else is effectively the same.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e02d024688b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.