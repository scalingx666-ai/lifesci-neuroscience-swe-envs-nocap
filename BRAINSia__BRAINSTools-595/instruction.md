# Issue

**Title:** ENH: Add code coverage infrastructure and Tier 1 GTests

## Description

## Summary

- Add pixi `code-coverage` environment with gcovr for coverage analysis
- Add 54 fast GTests targeting non-algorithmic utility code (IO, parsing, transforms, image math)
- Baseline coverage: **50.4%** (33,201 / 65,912 lines) — submitted to CDash

## Coverage infrastructure

`pixi run -e coverage code-coverage` runs the full pipeline:
configure → build (reuses EPs from `pixi run -e cxx build-EP`) → test → gcovr report

Reports are timestamped under `build-coverage/reports/<YYYYMMDDHHMMSS>/`:
- `coverage.xml` — Cobertura format for CI tooling
- `coverage.json` — machine-readable, diffable between runs
- `html/index.html` — browsable per-file line annotations
- `latest` symlink always points to most recent run

CTest `ExperimentalCoverage` + `ExperimentalSubmit` sends results to CDash.

## Tier 1 GTests (54 tests, <2s total)

| Test file | Tests | Target code | Uncovered lines addressed |
|-----------|------:|-------------|--------------------------|
| itkIOGTest.cxx | 8 | itkIO.h read/write/copy/cast | 343 |
| ConvertToRigidAffineGTest.cxx | 6 | ConvertToRigidAffine.h transforms | 431 |
| ImgmathGTest.cxx | 19 | Imgmath.h image arithmetic | 233 |
| DWIMetaDataDictionaryValidatorGTest.cxx | 13 | DWI metadata validation | 208 |
| ImageCalculatorUtilsGTest.cxx | 11 | String/parsing utilities | 220 |
| Slicer3LandmarkIOGTest.cxx | +6 | FCSV landmark file round-trip | 294 |

All tests use non-trivial pixel/coordinate values (42.5, -17.3, 255, 0.001) to catch truncation, sign errors, and floating-point precision loss.

## Test plan

- [x] `pixi run -e cxx build` — 0 errors, 0 warnings
- [x] 54/54 new GTests pass
- [x] 427/427 existing tests still pass
- [x] Coverage submitted to CDash (tag 20260408-1344)
- [ ] CI: Ubuntu GCC
- [ ] CI: macOS Clang

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4519acc786fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.