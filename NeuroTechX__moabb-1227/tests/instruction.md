# Issue

**Title:** Release 1.8.0 preparation: changelog + version bump

## Description

## Release 1.8.0 preparation

Prepared on `release/1.8.0-prep` (branched from `origin/develop @ a2180fabb`).

Two commits so the changelog can land independently of the exact version
number:

1. `doc(whats_new): record #1204 equation formatting fix for 1.8`
2. `release: bump version to 1.8.0 and date whats_new header (2026-10-06)`

### Checklist for the release manager

- [ ] Confirm the target version number (**1.8.0** proposed). If different,
      cherry-pick commit 1 only and bump separately.
- [ ] `docs/source/whats_new.rst` `Version 1.8` section audited against every
      PR merged into `develop` since `v1.7.2` (2026-09-14). See
      `R1-REPORT.md` for the per-PR table. All dataset classes added since
      `v1.7.2` are listed. `no changelog`-labelled PRs
      (#1181 #1216 #1219 #1222 #1223 #1224) are intentionally omitted.
- [ ] Catalog consistency: `pytest moabb/tests/test_metadata.py
      moabb/tests/test_datasets.py -k 'catalog or nemar_id or metadata'`
      → 865 passed, 244 skipped (`MOABB_DOWNLOAD_PROVIDER=auto`).
      `test_metadata.py` alone → 286 passed. `summary_*.csv` row counts
      (imagery 105, p300 68, ssvep 18, cvep 8, imagined_speech 7, rstate 3)
      match the exports in `moabb/datasets/__init__.py`.
- [ ] CI on `develop`: latest `Test` ✅ success, `Test-braindecode` ✅ success,
      `Link Check` ✅ success, `Docs` ❌ failure (known OSF 429 flake on
      `plot_dreyer_clf_scores_vs_subj_info.py`, see report).
- [ ] Pre-commit: ran clean locally against both commits.
- [ ] Tag `v1.8.0` and publish to PyPI (release manager's action; **not**
      done here).

### Not merged
Do not merge this PR until Bruno confirms the version number and tag plan.
No tag has been created.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b13ec1826861`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.