# Issue

**Title:** COMP: Bump vtkAddon to pruned wrapping DEPENDS

## Description

Bumps the vtkAddon `GIT_TAG` in `SuperBuild.cmake` to

(Slicer/vtkAddon#71, "PERF: Minimal, correct Python wrapping DEPENDS under lazy VTK loading").

### Why

This is the dependency companion to #9326, which removed the hand-maintained
list of ~28 core `vtkmodules` imported explicitly in `slicer/__init__.py`. As
@jamesobutler ,
#9326 needs a corresponding vtkAddon commit-hash bump.

That hardcoded list could only be dropped once each wrapped module's generated
init imports exactly the VTK modules that provide its direct base classes. The
pruned wrapping `DEPENDS` in the bumped vtkAddon is what makes the generated
inits do that. Without this bump, the wrapped modules still list every VTK
module, subclasses may not resolve their bases as the kits load, and the startup
gains from #9326 do not materialize.

### Details

- Old tag: `2ed3e2226cf25958b4dbf8bf917b2f7793ecd6a2` (2025-12-23)
- New tag: `9644d27e4d63cb2ed6a018c4a9cba6f71dda5904` (current vtkAddon `main` HEAD; 7 commits ahead, 0 behind — a clean forward bump)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `054379095d6d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.