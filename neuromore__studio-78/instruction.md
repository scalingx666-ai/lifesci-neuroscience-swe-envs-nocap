# Issue

**Title:** Refactor Special Feedbacks

## Description

**Improves/Fixes Support for The Special Feedback Nodes**

These ones were refactored/fixed and will now work on all platforms:

* **Volume**: Controls volume of all active audio playbacks and the video playback
* **ScreenBrightness**: Controls alpha-blending of video/image playback with black (0.0=full black, 1.0=unchanged image)

This one still exists, but does work on Windows only:

* **MasterVolume**: Modifies active OS Audio-Device Volume.

This one has been removed:

* **LSD!**

All Windows GDI related code has been removed.

**Screenshot**
![special_feedbacks](https://user-images.githubusercontent.com/780159/93345541-3d149100-f833-11ea-97cc-2a6ab0ca2ca0.PNG)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d51a6cf0eabd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.