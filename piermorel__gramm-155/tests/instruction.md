# Issue

**Title:** Avoid static opengl usage on newer MATLAB

## Description

## Summary

This avoids the static `opengl software` command syntax in `gramm/@gramm/draw.m`.

MATLAB R2026a removes `opengl`, and `buildtool check` / Code Analyzer can report the existing command syntax even though that branch is intended only for pre-R2014b handle graphics. `handle_graphics` is initialized as `~verLessThan('matlab','8.4.0')`, so modern MATLAB releases should not execute this branch.

The change keeps the legacy pre-R2014b behavior by using:

```matlab
feval('opengl','software');
```

That removes the direct static command form while keeping the compatibility path local to the old handle-graphics branch.

.

## Verification

I do not have MATLAB available in my local Codex environment, so I cannot honestly claim a local MATLAB pass.

Completed here:

- Applied cleanly to current `master`.
- Confirmed `opengl software` no longer appears as a direct command in the repository.
- Ran `git diff --check`.

Useful maintainer-side verification:

- `openProject('gramm.prj'); buildtool check` on R2026a or newer.
- `openProject('gramm.prj'); buildtool runExample`.
- The MATLAB GitHub Actions workflow, since the default build tasks include both `check` and `runExample`.

## Risk / Compatibility Note

If this branch were ever reached in R2026a+, the dynamic call would still fail because `opengl` is removed. The intended safety condition is that this branch is only active when `handle_graphics` is false, i.e. pre-R2014b MATLAB.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7aef54a945a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.