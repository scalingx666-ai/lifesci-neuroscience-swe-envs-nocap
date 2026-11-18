# Issue

**Title:** COMP: Fail early when VTK cannot tell what version it is

## Description

VTK determines its version by running `git describe` in its source tree (`VTKDetermineVersion.cmake`). A clone without the release tags (a fork pushed without tags, or a shallow clone) therefore makes VTK report the version of whatever old tag is still reachable.

The build then fails hours later at unrelated places: ITK's VtkGlue falls back to the pre-9 target names and compiles without VTK include directories, vtkAddon asks for variables that VTK 9 does not define, and Slicer's `find_package(VTK 9.x)` rejects the VTK that was just built. None of these errors mention the VTK version or the missing tags.

This PR checks the version in two places:
- A step in the VTK external project runs `vtk-verify-version.cmake` after the source is downloaded, before VTK is built.
- Slicer's configure step checks the version that VTK reports, before anything downstream uses it.

Both report what happened and how to fix it (fetch the tags, and push them to the fork as well).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ceb2e7ab3f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.