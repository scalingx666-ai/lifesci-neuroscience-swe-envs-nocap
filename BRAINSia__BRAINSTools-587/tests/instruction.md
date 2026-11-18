# Issue

**Title:** ENH: Add GTest infrastructure and port LocaleSafeConversions to GTest

## Description

## Summary

- Adds `CMake/BRAINSToolsGTest.cmake` providing a `brainstools_enable_gtest()` macro that first tries `find_package(GTest QUIET)` (picks up Homebrew/system installations), then falls back to `FetchContent` downloading GTest v1.17.0 from GitHub — no SuperBuild changes required, compatible with the project's CMake ≥ 3.20.6 minimum.
- Adds `BRAINSCommonLib/TestSuite/LocaleSafeConversionsGTest.cxx`, a complete GTest port of all 10 test categories from the custom-harness `LocaleSafeConversionsTest.cxx`.
- Updates `BRAINSCommonLib/TestSuite/CMakeLists.txt` to build the GTest target and register tests via `gtest_discover_tests()`, giving each test case its own named, individually-reportable CTest entry.

## Test categories

| Suite | Description |
|---|---|
| `RoundTrip*` | Basic double / float / int / uint parsing correctness |
| `LocaleIndependenceTest/CommaDecimalLocales/*` | 41 parameterised tests, one per comma-decimal locale; each is independently SKIP-able if locale not installed |
| `DicomPadding*` | Siemens CSA `\n`-padded and `\0`-padded DICOM header fields |
| `SentryBugRegression` | Guards against `std::ws` + `eofbit` → `failbit` regression |
| `Error*` | Empty, null-only, whitespace-only, trailing junk all throw |
| `StodMatch*` / `StoiMatch*` | Behaviours preserved from `std::stod` / `std::stoi` |
| `StodDiff*` / `StoiDiff*` | Intentional strictness differences documented as tests |
| `SafeStoui*` | Wraparound, boundary, overflow, trailing whitespace |

## Dependencies

**Depends on PR #586** (`fix/403-locale-safe-migration`) which provides the enhanced `LocaleSafeConversions.h` with `detail::null_truncate()` and `detail::only_whitespace_remains()`. This PR is based on that branch and should be merged after it.

## Test evidence

All 42 tests pass locally on macOS / Apple Clang:
- 41 named GTest cases (including all DICOM padding, sentry-bug, and locale tests)
- 1 original `LocaleSafeConversionsTest` (retained for continuity)

```
100% tests passed, 0 tests failed out of 42
Total Test time (real) =   0.41 sec
```

## AI Disclosure

This PR was developed with Claude Code (Anthropic). The implementation strategy was determined via Context7 MCP documentation queries. All tests were validated locally by running the full CTest suite. The author reviewed and is accountable for all changes.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7950857ff482`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.