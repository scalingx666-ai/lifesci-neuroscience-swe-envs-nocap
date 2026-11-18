# Issue

**Title:** Fix from nifti float error

## Description

**Title:** fix: keep full-precision affine and data-specific cache key in from_nifti

### Summary
- Fix `from_nifti`/`from_array` volumes losing affine precision, which made the BigBrain layer contours in the fig5 tutorial disappear.
- Fix a cache collision where volumes with equal name, space, shape and affine reused another volume's data.
- Restore the given volume name, which was replaced by an md5 hash.

### Changes
- `siibra/volumes/volume.py`:
  - `from_nifti` keeps the data file-backed (lazy array proxy of the cached file), but uses the full-precision affine of the input image instead of the float32 affine read from the file.
  - The volume is built directly instead of via `from_file`, so the given `name` is kept.
  - The cache key is now `name-space-affine-digest`; the digest covers data, shape, dtype and time axis.
  - New private helpers: `_data_digest` (the algorithm `from_array` already used to generate names, so generated names are unchanged) and `_to_cached_volume` (shared body), so `from_array` computes the digest once.
  - Docstrings and return type hints updated; corrected the `from_array` docstring on which inputs determine the generated name.
- `test/volumes/test_volume_constructors.py`: new unit tests (no network; space registry and cache patched).
- `.github/workflows/docs.yml`: build docs for `fix_*` branches.

### Tests
- `test_affine_keeps_full_precision`, `..._when_cache_file_exists`, `test_timeseries_affine_keeps_full_precision`: exact float64 affine for both constructors, for existing cache files, and on the time-series path.
- `test_data_stays_file_backed`: data is still read lazily from the cache file.
- `test_same_name_different_data_not_shared`: regression test for the cache collision.
- `test_generated_name_is_stable`, `test_generated_name_ignores_affine_and_space`: generated names are unchanged and depend only on data/time.
- `test_name_is_kept`: regression test for the dropped name.

### Notes
- Root cause: 91fdb94f made `from_nifti` file-backed. NIfTI stores the affine as float32 (1.0905000000000087 -> 1.090499997138977), so in fig5 `Plane.from_image(patch)` ended up ~3e-9 mm below the ROI's lower bound, and the closed-interval check in `Contour.crop` dropped all contour points.
- Behaviour changes, no deprecations:
  - cache file names change, so cache files written by current `main` are not reused;
  - `from_nifti` reads the image data once for the digest, even when the cache file exists;
  - `Volume.name` is the given name again;
  - `Volume.providers` raises `TypeError` for these volumes (no `_url`), as on `v1` and for `from_array(cache=False)`.
- nilearn >= 0.13.1 view order (`ortho`/`tiled`/`mosaic`: yxz -> xyz, `yx` -> xy): fig5 glass-brain fix is already on `main` (585ae967); all other examples, docs and library code were checked and are unaffected.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `585ae9679439`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.