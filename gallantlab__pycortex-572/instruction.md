# Issue

**Title:** Blender flattening support

## Description

## Overview

Thank you for maintaining pycortex—i found it to be an invaluable tool for visualization of cortical data.

Please consider this PR that offers an extension the the flattening modes (+notebook, +docs, +video). Please provide your feedback and I will be happy to adjust the modification. Thank you!

cc @cmcneil @tysonnsa.

### Why

1. While `freesurfer` mode has been used for a long time, it lacks debuggability and may require a number of iterations and a degree of patience in order to get things working. The new mode is added to timebox the flattening process by making it faster and more predictable by leveraging UV unwrap preview in Blender. This PR adds a 3rd mode of flattening that is based on Blender's UV unwrap. This mode will reduce time to flatten while producing decent quality unwraps.
2. Outdated dependencies. As I've been spinning up my flattening workflow, I kept running into dependency issues around Python, Blender, FreeSurfer with impacts ranging from just breaking to hard to debug symptoms. This PR fixes some of those and adds a new mode of flattening that relies on Blender over freesurfer.

### What

- [x] Implemented flattening logic that uses conformal UV unwrap in `cortex.blender.blendlib.py`. It follows the same selection as for the volume mesh. This is accessible via `write_flat_patch`.
  - To avoid confusion between the new flat patch `write_flat_patch` and the old one, renamed `save_patch` into `write_volume_patch`.
  - Renamed `_get_pts_edges` into `_get_geometry` for clarity. Added clarifying logging and elapsed time tracking. Extended docstring.
- [x] Fix for Python 3.13+: allow blender access Python site directory to search for `mda_xdrlib` that was removed from Python 3.13.
- [x] Refactored `cortex.blender._call_blender to support non-code calls to Blender to reduces confusion and improves code clarity. Refactored `fs_cut` into `fs_cut_init` and added a new `fs_cut_open` to improve clarity. Extended docstring.
- [x] Rewrote `cut_surface` for clarity. Onboarded to `recache` flag to support forced generation.
- [x] Record a tutorial video walking users through the process of cutting. Should follow the gallantlab.org approach to cutting.
- [x] Add python notebook for the end-to-end rendering of fMRI.
- [x] Update docs with the guidance.
  - Fixed the existing docs confusing `”` and `"` which may result into code examples not running properly.
  - Retrofilled docs for some of the existing methods.
- [x] Address the PR feedback.

### [Tutorial video](https://www.youtube.com/watch?v=D4tylQ_mMuM)

As different labs may approach cuts slightly differently, created and edited a [tutorial video](https://www.youtube.com/watch?v=D4tylQ_mMuM) instruction that follows the style of gallantlab.org. The used anatomy was taken from [Horikawa, T., Cowen, A. S., Keltner, D., & Kamitani, Y. (2020). The neural representation of visually evoked emotion is high-dimensional, categorical, and distributed across transmodal brain regions.](https://www.sciencedirect.com/science/article/pii/S2589004220302455?ref=pdf_download&fr=RR-2&rr=95089e98cee0f79b).

### Docs update

Added a new section on the cuts. When rendered looks as follows:

<img width="472" alt="image" src="https://github.com/user-attachments/assets/3179cfe2-bf1f-4319-9784-0a10cba0c35b" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3390c1da1cd6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.