# Issue

**Title:** COMP: Build only the VTK modules the enabled tools use

## Description

Builds only the VTK modules the enabled tools use. For the CI configuration that cuts VTK's compile CPU time by 56% and lets VTK build alongside ITK and ANTs instead of in front of them.

<details>
<summary>What changes</summary>

- `BRAINSTools_REQUIRES_VTK_RENDERING` is on only when a GUI or archived tool is enabled (Qt, BRAINSConstellationDetectorGUI, DebugImageViewer, ITKMatlabIO, BRAINSTalairach). Then the previous VTK configuration is unchanged.
- Otherwise VTK builds only what GTRACT links: Common{Core, DataModel, Math, Misc, System, Transforms}, FiltersCore, FiltersGeneral, IOXML, IOLegacy, and their dependencies. VtkGlue, which forces VTK's rendering stack, is not built.
- ITK needs VTK only for VtkGlue, and ANTs is configured with `USE_VTK=OFF`, so neither depends on the VTK build any more.

</details>

<details>
<summary>Testing</summary>

- VTK built alone with the CI flags (macOS arm64, ccache off, `-j6`): 86.3 CPU-minutes with the default modules, 37.6 with this change. The minimal build produced exactly the expected module set.
- A full CI-style SuperBuild with this change plus the ITK 5.4.7 and VTK pin updates passed all 507 tests CI runs (0 failed). It was validated together with those pins, not alone.
- In a CI-style inner build, `USE_VTK` is undefined and no compiled object includes a VtkGlue or rendering header.
- VTK and ITK tests and examples were already off.

</details>

<details>
<summary>AI disclosure</summary>

Claude Code wrote the change and ran the checks listed above. The author reviewed the diff.

</details>

<!--
provenance: claude-code session 2026-10-31
related: independent of the other PRs; validated together with comp-superbuild-update-itk-vtk-pins
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f686138b2762`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.