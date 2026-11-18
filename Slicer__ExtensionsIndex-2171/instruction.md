# Issue

**Title:** Add SegTemplateEditor extension

## Description

This pull request adds the metadata for a new 3D Slicer extension: **SegTemplateEditor**.

---

### Extension Overview  
**SegTemplateEditor** is a simple extension that allows users to:

- Create and save custom label groups for segmentation  
- Apply visually distinct colors to each label using golden-ratio hue stepping  
- Load, reuse, and apply label groups via GUI  
- Automatically apply selected groups to the Segment Editor

Repository: https://github.com/esheo-skia/Slicer-SegTemplateEditor 
License: MIT  
Category: Segmentation  

---

### Checklist for Tier 1 (All Completed)

- [x] Repository follows naming convention: `Slicer-SegTemplateEditor`  
- [x] Extension has license: MIT  
- [x] README, icon, and basic documentation provided  
- [x] Extension metadata file (.s4ext) is complete  
- [x] `SegTemplateEditor.json` has been added  
- [x] `scmrevision` uses `main` (not a specific commit hash)  
- [x] Public GitHub repository is accessible  
- [x] Icon URL uses raw format and is accessible  
- [x] Screenshot URLs added  
- [x] Extension does not include or download binaries, and does not send data  
- [x] GitHub wiki, projects, and discussions have been disabled  

---

All CircleCI checks have passed and the repository satisfies all Tier 1 requirements.  
Looking forward to review and feedback from the core team.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6639762d6f92`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.