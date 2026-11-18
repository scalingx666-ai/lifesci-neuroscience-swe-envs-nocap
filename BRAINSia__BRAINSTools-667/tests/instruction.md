# Issue

**Title:** COMP: Update the ITK and VTK pins to what Slicer main builds

## Description

Updates the ITK pin to `v5.4.7` and the VTK pin to the commit Slicer main builds (`470a7a557a`, VTK 9.6.2), replacing an early-April `release-5.4` merge commit and a VTK commit from May.

<details>
<summary>Details and testing</summary>

- Slicer main builds ITK 5.4.7 plus its own patches, and its VTK 9.6.2 branch at `470a7a557a`. `v5.4.8` is also released if a newer ITK is preferred.
- A full CI-style SuperBuild (macOS arm64, ccache off) with these pins and the minimal-VTK change passed all 507 tests CI runs, 0 failed. It was validated together with the minimal-VTK PR and, in a later run, the ANTs update, not alone.

</details>

<details>
<summary>AI disclosure</summary>

Claude Code wrote the change and ran the checks listed above. The author reviewed the diff.

</details>

<!--
provenance: claude-code session 2026-10-31
related: independent; validated together with comp-superbuild-minimal-vtk and comp-superbuild-update-ants
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5961fc33bb95`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.