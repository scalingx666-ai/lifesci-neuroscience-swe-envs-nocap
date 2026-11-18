# Issue

**Title:** BUG: Deprecate DWIConvert; fix #294, #370, #457; document #342, #412

## Description

## Summary

- Add a deprecation notice to `DWIConvert/README.md` directing users to [dcm2niix](https://github.com/rordenlab/dcm2niix)
- Document that DWIConvert will be moved to `ARCHIVE/` in a future release
- List known open issues that will not be fixed, with migration guidance

## Issues addressed

This PR serves as the sunset notice for DWIConvert. The following issues
should be closed once this is merged, as they will not be fixed:

-  -- UINT16 pixel data incorrectly read as INT16
-  -- Incorrect handling of coronal DICOM acquisitions
-  -- Segfault when converting Nrrd to NIfTI
-  -- NrrdToFSL produces inconsistent results
-  -- Generic gradient tags not recognized

## Context

As noted by the maintainer on #457, DWIConvert has been superseded by
dcm2niix which has broader community support and better maintenance.
Rather than fixing these long-standing issues in a tool that is being
retired, this PR documents the deprecation and points users to the
recommended replacement.

## Test plan

- [ ] Verify README.md renders correctly on GitHub
- [ ] Confirm all five issue numbers are correctly referenced

## AI disclosure

This PR was drafted with assistance from Claude (Anthropic). The
deprecation text and issue summaries were composed by the AI agent based
on maintainer direction. All content was reviewed before committing.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `117195f6a623`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.