# Issue

**Title:** BUG: Fix MIH baselines for the corrected ITK JHMI metric on both ITK 5.4 and 6

## Description

The two MIH registration tests now carry **both** baseline sets and select between
them at configure time, so they pass on ITK `release-5.4` and on ITK `main`.
ITK  corrected the
JointHistogramMutualInformation marginals and derivative, so the registrations
converge to a different — and correct — result on any ITK carrying that fix.

> **Depends on ITK ** (YYYYMMDD tweak version, which superseded #6665).
> Against an ITK `main` that predates #6667 there is no way to detect #6569, so the
> legacy arm is taken and these two tests fail. This PR can only be green on both
> branches once #6667 merges.

<details>
<summary>Why replacing the baselines in place could not work</summary>

The first commit regenerated the baselines at their original paths. That makes the
tests pass on ITK 6 and fail on ITK 5.4.6, which cannot carry #6569 — the metric
there still produces the old answer. A single baseline cannot serve both branches,
so both now ship: the pre-#6569 results stay where they were, and the regenerated
ones live in `TestData/post-ITK6569/`.

</details>

<details>
<summary>The selection mechanism</summary>

```cmake
if(ITK_VERSION_FULL VERSION_GREATER_EQUAL 6.0.0.20260715)
  set(MIH_BASELINE_DIR ${TestData_DIR}/post-ITK6569)
else()
  set(MIH_BASELINE_DIR ${TestData_DIR})
endif()
```

`ITK_VERSION_FULL` carries a `YYYYMMDD` tweak component exported by ITK #6667.
Because #6667 postdates #6569, any ITK that defines the variable contains the fix;
older ITK (including 5.4) leaves it unset, the comparison is false, and the legacy
baselines are chosen with no guard needed. A future 6.1.0 release also satisfies
the same comparison, so a single condition suffices — this resolves the
two-arm/expiry open question from the earlier sentinel design.

</details>

<details>
<summary>Local verification</summary>

Built and run in the ITK downstream forest testbed under the previous (sentinel)
gating, both MIH tests passing on each:

| ITK under test | Baselines selected | Result |
|---|---|---|
| ITK main + between-tag signal | `post-ITK6569/` | 2/2 pass |
| `release-5.4` (5.4.6) | legacy | 2/2 pass |

Negative control — the post-#6569 baseline under ITK 5.4.6 differs by **2738 pixels
against a 777-pixel tolerance** (exit 1). The selection decides the outcome; it is
not tolerances absorbing the difference. The rewritten condition changes only the
detection variable, not which baselines are selected on either branch.

</details>

<details>
<summary>AI assistance disclosure</summary>

Per `AGENTS.md`. Claude Code performed the analysis and authored the CMake selection
logic and the baseline reorganization. Both baseline hash sets were read out of git
history (`767ba471` for legacy, `a06d890a` for post-#6569), not transcribed. Build
and test results above were produced by running the actual builds and tests
locally, not asserted.

</details>

<!--
provenance: claude-code sessions 2026-07-20
key_files:
  BRAINSFit/TestSuite/CMakeLists.txt : MIH_BASELINE_DIR condition, ~line 1071
  TestData/post-ITK6569/             : regenerated baselines (2 sha512 sidecars)
commits:
  a06d890a BUG: Regenerate MIH baselines for corrected ITK JHMI metric
  7ad484ce ENH: Select MIH baselines by ITK tweak version (replaced sentinel commit 9c86141c)
gate: ITK_VERSION_FULL >= 6.0.0.20260715; initial tweak in ITK #6667, safe because #6667 postdates #6569 (merged 2026-07-16)
blocked_on: InsightSoftwareConsortium/ITK#6667 must merge before CI on ITK main is green
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `767ba4710d7f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.