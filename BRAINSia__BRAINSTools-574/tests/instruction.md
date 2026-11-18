# Issue

**Title:** ENH: Support .fcsv file extension in BRAINSConstellationDetector

## Description

## Summary

- Adds missing `fileExtensions=".fcsv"` attributes to SEM XML parameter definitions for landmark file parameters across BRAINSConstellationDetector tools
- Enables Slicer's native fiducial file format (.fcsv) to be properly associated with landmark I/O parameters in the Slicer GUI file browser dialogs
-

## Details

Several BCD tool XML files had `<file>` elements for landmark parameters without `fileExtensions` attributes, which meant Slicer could not filter file dialogs to show .fcsv files. This change adds the missing attributes to:

| File | Parameters updated |
|------|-------------------|
| `insertMidACPCpoint.xml` | `inputLandmarkFile`, `outputLandmarkFile` |
| `landmarksConstellationAligner.xml` | `inputLandmarksPaired`, `outputLandmarksPaired` |
| `LandmarksCompare.xml` | `inputLandmarkFile1`, `weights` |
| `GenerateAverageLmkFile.xml` | `inputLandmarkListFile`, `outputLandmarkFile` |

The main `BRAINSConstellationDetector.xml` and other tools (`BRAINSAlignMSP`, `BRAINSLmkTransform`, `BRAINSTransformFromFiducials`, `BinaryMaskEditorBasedOnLandmarks`, `BRAINSConstellationLandmarksTransform`) already had correct `.fcsv` fileExtensions and required no changes.

This is related to the SlicerExecutionModel commit that added point file support:

## AI Disclosure

This PR was prepared with assistance from Claude (Anthropic). The AI identified XML files with missing `fileExtensions` attributes on landmark file parameters and generated the edits. All changes were reviewed for correctness against the existing XML patterns in the codebase.

## Test plan

- [ ] Verify XML files pass validation (pre-commit hook `check xml` passes)
- [ ] Build BRAINSConstellationDetector and confirm SEM generates correct CLI argument parsing
- [ ] Load BCD module in Slicer and verify file browser dialogs show .fcsv filter for landmark parameters

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e8e38c0f783`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.