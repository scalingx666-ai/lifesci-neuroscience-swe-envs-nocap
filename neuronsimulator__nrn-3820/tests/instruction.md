# Issue

**Title:** Add cover-diff target for changed-line coverage reports

## Description

## Summary

Adds developer-facing **changed-line** coverage on top of the existing `NRN_ENABLE_COVERAGE` workflow. Whole-file `cover-html` reports are useful but do not distinguish lines changed on a branch from legacy uncovered code. The new `cover-diff` target wraps [`diff-cover`](https://github.com/Bachmann1234/diff_cover) and reports coverage on the diff against a base branch (same idea as Codecov patch coverage).

## Changes

- **`cover-diff` CMake target** (`cmake/Coverage.cmake`): collects/combines lcov data, then runs `diff-cover` on `coverage-combined.info`. Optional at configure time if `diff-cover` is not installed.
- **`NRN_COVERAGE_DIFF_BRANCH`** cache option (default `master`) for `--compare-branch`.
- **`ci/coverage_files_from_diff.sh`**: emits a semicolon-separated `.cpp`/`.c` file list for `-DNRN_COVERAGE_FILES=...` from a three-dot git diff.
- **Hyphenated aliases**: `cover-begin`, `cover-html`, `cover-diff` (underscore names unchanged).
- **Docs**: `docs/install/code_coverage.md`, `docs/cmake_doc/options.rst`.

## Typical workflow

```bash
cmake .. -DNRN_ENABLE_COVERAGE=ON -DNRN_COVERAGE_FILES="$(../ci/coverage_files_from_diff.sh master)" ...
ninja cover-begin
ctest -j8   # along with, for faster focussed testing: -R 'some_test_pattern'
ninja cover-diff    # changed-line report: build/html-diff/index.html
ninja cover-html    # whole-file report: build/html/index.html
```
The last two commands end by printing a local url one can copy and paste into the browser.

## Dependencies

```bash
sudo apt install lcov
pip install diff-cover
```

## Notes

- Developer-only tooling; no CI workflow changes (existing `.github/workflows/coverage.yml` unchanged).
- `diff-cover` is invoked from `PROJECT_SOURCE_DIR` so lcov `SF:` paths align with `git diff` paths.
- `coverage_files_from_diff.sh` exits with an error when no compiled sources changed (omit `-DNRN_COVERAGE_FILES` in that case).

## Testing

Manually exercised on an `slds`-related branch with selective `NRN_COVERAGE_FILES` instrumentation: `cover-html` and `cover-diff` both produce expected reports vs `master`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db8b6a877c95`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.