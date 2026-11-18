# Issue

**Title:** SlicerStrokeSegmentator automated chronic stroke lesion segmentation on T1w MRI

## Description

# New extension
## Tier 1

Any extension that is listed in the Extensions Catalog must fulfill these requirements.

 [x] Extension has a reasonable name (not too general, not too narrow, suggests what the extension is for).

 [x] Repository name is Slicer+ExtensionName

[x] Repository is associated with `3d-slicer-extension` GitHub topic

[x] Extension description summarizes in 1-2 sentences what the extension is usable for

[x] No known related patents

[x] LICENSE.txt is present in the repository root (Apache 2.0)

 [x] Extension URL and revision (scmurl, scmrevision) is correct, using branch name `main`

 [x] Extension icon URL is correct raw GitHub URL

 [x] Screenshot URL is present

 [x] Content of s4ext file is consistent with CMakeLists.txt (no dependencies)

Homepage URL points to valid webpage containing:
   [x] Extension name
   [x] Short description
   [x] Screenshot image
   [x] Module description
   [ ] Publication — manuscript in preparation, will update upon submission

 Hide unused GitHub features:
   [x] Wiki, Projects, Discussions unchecked
  * [x] Releases and Packages unchecked

* The extension is safe:
  * [x] Model downloaded from HuggingFace — reputable source
  * [x] No data sent anywhere without user action (model download requires explicit button click)

 
## Tier 3

Community-supported extensions.

 [ ] Documentation, tutorial, and test data — basic README provided, full tutorial planned upon paper submission

[ ] Follows programming and user interface conventions of 3D Slicer — GUI and logic are separated, no popups, no custom styling

 [ ] The extension can be successfully built and packaged on all supported platforms — tested on Linux; Windows and macOS not yet verified

[x] Maintainers respond to issues and pull requests submitted to the extension's repository

[x] Maintainers respond to questions via @mention on the Slicer Forum

[x] Apache 2.0 license used throughout

All requirements of tiers < 3 — see above


## Tier 5

Not applicable — submitting as Tier 1 (Experimental).

 [ ] Slicer core developer support — not applicable for Tier 1
 [ ] Automated tests — not yet implemented
 [ ] Forum support — will respond to questions

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0848e9df94ba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.