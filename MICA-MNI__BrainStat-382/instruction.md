# Issue

**Title:** Release 0.6.0

## Description

## Summary

Bumps `brainstat.__version__` to **0.6.0** and adds a project `CHANGELOG.md` documenting the work folded in across #378 / #379 / #380 / #381.

This is a **minor** release — see the *Backwards-incompatible changes* section of the changelog for the user-visible behaviour shifts (BigBrain histology profile inversion, SLM input coercion, numpy/pandas pins).

## What landed (full detail in `CHANGELOG.md`)

**Statistics-core bug fixes**
- yeo7 off-by-1 indexing in `SLM._surfstat_to_brainstat_rft` (#347)
- `cmath.sqrt` → `math.sqrt` in `SLM.py`
- duplicate `fetch_template_surface` import dropped
- `sys.exit` in `_t_test.py` replaced with `raise ValueError`
- `float(...)` on size-1 ndarrays replaced with `.item()` (numpy 2 compat)

**Public-API contract fixes (#342)**
- `SLM.__init__` coerces `contrast` to numeric; rejects object/categorical with a clear `TypeError`
- `SLM.__init__` coerces integer 0/1 `mask` to bool
- `surf=None + correction='rft'` error now points users at `correction='fdr'`

**Behaviour change (#274)**
- `read_histology_profile` now inverts BigBrain intensities by default (`invert=True`); `invert=False` recovers prior behaviour. MPC/gradient outputs are unaffected.

**New features**
- `fetch_parcellation(template, "destrieux", ...)` returns the FreeSurfer Destrieux 2009 parcellation (#343)

**Maintenance**
- CI fully restored across Python (3.10/3.11 × 3 OS) and MATLAB (R2022a/latest) (#379)
- Hardened MATLAB Neurosynth fetcher with zip integrity check + retry (#341)
- MATLAB R2019b/R2020a kept buildable: `peak_clus.column_vector` no longer uses `mustBeVector` (#285)
- `# type: ignore` removed from `SLM.py` and `_multiple_comparisons.py`; mypy no longer crashes on the class-body imports (#199)

## Tests / coverage

- 276 tests pass, 1 platform-skipped on the local sweep.
- 4 new volumetric tests cover the contrast / mask / FDR paths from #342.
- Total coverage: 62% (a couple of context modules and the data-generator scripts pull the average down; the actively maintained statistics core sits between 64% and 95%).

## How to publish

Once this PR merges:
1. Tag `v0.6.0` on `master` to trigger `tagged_release.yml` (PyPI + MATLAB artifact + GitHub Release).
2. Verify the release notes on GitHub mirror the changelog entry.

## Out of scope (still tracked)

- Volumetric cluster-level RFT/TFCE in `SLM` (the ambitious half of #342)
- Hosted Desikan-Killiany atlas in `fetch_parcellation` (companion to #343)
- Lifting the `setuptools<81` / `numpy<2` / `pandas<2.1` pins once `abagen` is patched
- Re-enabling the commented-out `mypy` CI job once the ~380 latent typing errors are triaged

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b588136f9c1b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.