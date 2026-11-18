# Issue

**Title:** Respect explicit interprocedural optimization settings

## Description

A successful IPO/LTO capability probe currently forces `CMAKE_INTERPROCEDURAL_OPTIMIZATION` to TRUE, overriding an explicit OFF from the caller. Enable LTO automatically only when the setting is undefined, and emit the unsupported warning only when the capability probe actually fails.

This changes exactly two lines in `console/ucm.cmake`, preserving its CRLF line endings. Default automatic enablement remains when supported. The fix respects settings received by the console helper; it does not add IPO forwarding to the superbuild or claim a specific Apple Silicon build failure is resolved.

Validation was limited to three synthetic CMake script cases executing the source-defined conditional block, with the capability result supplied without a compiler probe:
- Supported with explicit cache BOOL OFF: remains OFF, with no unsupported warning or enabled message.
- Supported with no setting: becomes TRUE, with no unsupported warning.
- Unsupported with no setting: remains unset and retains the existing warning/diagnostic.

All three passed. Git's default whitespace check reported the existing CRLF endings on the two added lines; `git -c core.whitespace=cr-at-eol diff --check` passed with the file's format preserved. Prior source/CMake documentation and toolchain/SDK/architecture evidence were reused; those checks were not rerun. No compiler probes, downloads, compilation, imaging tests, dcm_qa, codespell or broader suite was run. The focused harness and receipt are retained locally outside the two-line patch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5beba99a3fdb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.