# Issue

**Title:** ENH: Report compiler warnings/errors from Build.xml in CI log

## Description

## Problem

`ctest -D ExperimentalBuild` captures compiler diagnostics in `Build.xml` for
CDash submission but does not print them to stdout.  With `-j` parallel builds
the compiler output scrolls past quickly; warnings go unnoticed in CI until
someone checks CDash.  The result: CI passes green while silently accumulating
compiler warnings.

## Solution

**`Utilities/misc/report_build_diagnostics.py`** — ported verbatim from
[InsightSoftwareConsortium/ITK](https://github.com/InsightSoftwareConsortium/ITK)
commit `dee111669a` (`Testing/ContinuousIntegration/report_build_diagnostics.py`).

The script:
1. Reads `Testing/TAG` to find the most recent test-run directory
2. Parses `Testing/<TAG>/Build.xml` (written by CTest's ExperimentalBuild step)
3. Prints every `<Warning>` and `<Error>` element directly to stdout

**New CI step** — `Inner Build: Report compiler warnings and errors` — added to
`.github/workflows/build.yml` with `if: always()` so it runs whether the build
passed or failed.  Uses `|| true` so it is purely informational and never blocks
the pipeline.

## AI disclosure

Script copied verbatim from ITK upstream commit `dee111669a`.  CI wiring written
with Claude Code (Sonnet 4.6).  Per BRAINSTools policy opened as **Draft**.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4d6c4d21aba8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.