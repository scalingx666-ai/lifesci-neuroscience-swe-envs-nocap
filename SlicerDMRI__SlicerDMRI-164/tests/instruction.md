# Issue

**Title:** ENH: Switch ROI selection from Annotations to Markups #158

## Description

Since Annotations are deprected since Slicer 5, the corresponding MarkupsROI code is used. See linked issue for more details.

With this change the ROI node no longer has an `InteractiveMode`, which had been used to enable/disable hot-update of ROI selection and there does not appear to be a replacement in the Markups infrastructure.  However when using ROI selection it is actually the same to just disable ROI selection while editing the ROI and then switch back to positive or negative selection mode when ROI edit is finished.  Since this accomplishes the same result the checkbox is removed to simplify the code and the interface.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344e5f322947`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.