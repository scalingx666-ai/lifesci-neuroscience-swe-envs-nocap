# Issue

**Title:** COMP: Fix qSlicerSslTest build error caused by most vexing parse

## Description

Fixes the build error in last night's nightly builds on all platforms (Linux, Windows, macOS arm64):

```
qSlicerSslTest.cxx:82:10: error: member reference base type 'QNetworkRequest (QUrl)' is not a structure or union
qSlicerSslTest.cxx:83:35: error: no matching member function for call to 'get'
```

#9499 introduced `QNetworkRequest request(QUrl(url));`. C++ parses that as a function declaration rather than a variable (the "most vexing parse"), so the following `setAttribute()` and `get()` calls fail to compile. Because the build stopped there, many tests were never built, which caused most of last night's test failures.

This PR uses brace initialization, `QNetworkRequest request{ QUrl(url) };`, so that a variable is declared.

### Testing

On the macOS arm64 dashboard machine (Qt 6.11.1), this change was applied to the nightly source tree and an inner `make -k` build was run in the nightly build tree:
- The build completed with no errors.
- `qSlicerBaseQTCoreCxxTests` built, and so did every target the nightly didn't reach, including all code changed by #9498, #9499 and #9500.

The source tree was then restored to its committed state.

The same line failed with the same cause on Linux (GCC 14) and Windows (MSVC 2022, Qt 5.15). This change was not built on those platforms. The brace form compiled with Qt 5.15.2 and Qt 6.10.3 using MSVC 2022 in a standalone program.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `447e3ef4c390`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.