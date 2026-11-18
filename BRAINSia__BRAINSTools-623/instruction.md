# Issue

**Title:** COMP: Prefer the tiered itk::bridge::Math spelling for ITK's Eigen numerics

## Description

Keeps BRAINSTools on ITK's Eigen-backed numerics now that
InsightSoftwareConsortium/ITK#6768 has **merged**, moving the convenience numerics to
`itk::bridge::Math` (InsightSoftwareConsortium/ITK#6620). Chained `__has_include`
guards keep both the post-move and pre-move ITK on the Eigen path, so this builds
against either vintage.

Affects GTRACT `algo.cxx`, `LLSBiasCorrector.hxx`, `EMSegmentationFilter.hxx`,
and `fcsv_to_hdf5.cxx`.

<details>
<summary>Why this is needed even though nothing breaks</summary>

The pre-existing guards were bare `__has_include` probes of the pre-move header:

```cpp
#if __has_include(<itkMathLDLT.h>)
#  include <itkMathLDLT.h>
#endif
```

After the ITK rename that probe simply fails. There is **no compile error** — the
capability macro stays undefined and the code silently falls back to
`vnl_matrix_inverse`, with nothing in any log to say so.

Chaining the probe keeps either ITK vintage on the Eigen path:

```cpp
#if __has_include(<itkBridgeMathLDLT.h>)
#  include <itkBridgeMathLDLT.h>
#elif __has_include(<itkMathLDLT.h>)
#  include <itkMathLDLT.h>
#endif
```

Because both arms are retained, this is safe against pre-move and post-move ITK alike.

</details>

<details>
<summary>Test plan — built and measured against merged ITK</summary>

Validated against ITK `main` at `313b5234d52` (i.e. after #6768 merged), installed
from a dedicated build.

**1. Guard-arm probe.** A syntax-only compile of the guard against the installed ITK,
with one `#error` per arm, reports which branch the preprocessor actually takes:
all four files' `itkBridgeMathLDLT.h` chain resolves to **`ARM=BRIDGE(eigen)`**, not
the `vnl` fallback.

This matters because a successful build is consistent with *all three* arms — the
`vnl` fallback compiles fine, it just quietly abandons Eigen. The probe is what
distinguishes them.

**2. Inner build.** `ninja` over the inner project: **895/895 targets, 0 errors,
0 `FAILED` lines.** All four changed files are in that build:

| Changed file | Object |
|---|---|
| `GTRACT/Common/algo.cxx` | `GTRACTCommon.dir/algo.cxx.o` |
| `BRAINSConstellationDetector/src/fcsv_to_hdf5.cxx` | `fcsv_to_hdf5Lib.dir/fcsv_to_hdf5.cxx.o` |
| `BRAINSABC/brainseg/EMSegmentationFilter.hxx` | `BRAINSABCCOMMONLIB.dir/EMSegmentationFilter_float+float.cxx.o` |
| `BRAINSABC/brainseg/LLSBiasCorrector.hxx` | `BRAINSABCCOMMONLIB.dir/BRAINSABCUtilities.cxx.o` |

Configured with `USE_ANTS=OFF`, `BRAINSTools_USE_QT=OFF`,
`USE_BRAINSConstellationDetectorGUI=OFF`, `USE_DebugImageViewer=OFF`,
`USE_BRAINSSuperResolution=OFF` — the reused EP tree carries an ITK-5.4-based ANTs
and a Qt-less VTK, and none of those tools contain the files this PR touches.

Not run: the BRAINSTools test suite. This change alters which numerical backend is
selected, not the algorithms.

</details>

<!--
provenance: claude-code session 2026-08-21; ITK#6768 merged 2026-08-21T18:14:33Z
validation_itk: main @313b5234d52 installed to common_support_versions/ITK/installed_main_bridge
validation_build: ~/src/BT-bld-e2e/BRAINSTools-Release-bridge-EPRelease-build, 895/895 targets
guard_probe: ARM=BRIDGE(eigen) for the itkBridgeMathLDLT.h chain
capability_macro: ITK_BRIDGE_MATH_HAS_SOLVE_SYMMETRIC (itkBridgeMathLDLT.h:49) then ITK_MATH_HAS_SOLVE_SYMMETRIC
note: bt-configure-inner.sh forces ITK_DIR from its own EP glob; override must be verified
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db7baa6cab59`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.