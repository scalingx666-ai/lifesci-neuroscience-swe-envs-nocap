# Issue

**Title:** WebVR for 3D viewer

## Description

Add support for WebVR to the 3D viewer. [A demo video is on Twitter](https://twitter.com/aschampion/status/1099477830579163136).

Controls have been refined since the demo, with much better 1-to-1 control of the scene when using the two handed "grab" interaction.

VR is activated by two inputs in the view controls. This first is a checkbox that checks for and selects the first available VR device; the second is a button that enters or exits VR iff the checkbox is checked. This separation is necessary because:
- Entering a VR "presentation" has to happen in direct response to a user interaction according to the spec, which means it will not work if invoked from the promise that finds and selects the VR device.
- Some pages deal with this by checking the VR devices on load elsewhere, but for real VR headsets this check results in Windows MR Home/Oculus Home/SteamVR starting and the GPU going into leafblower mode.

@tomka: the final controls for entering and exiting VR are still a checkbox and button, but I was not able to embed the checkbox in the button as we discussed since this is not valid HTML5. Chrome was fine with it, but Firefox wouldn't let the checkbox receive events inside a disabled button.

### Known issues
- While most of the 3D viewer control (adding/removing skeletons, etc.) continues to work while in VR, if a mesh is added after VR is already started, the camera near frustrum gets changed and culls a lot of the scene.
- There is no attempt to robustly handle a lot of the VR associated events, e.g., detecting when the device has disconnected and exiting/unchecking the enable checkbox.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e0b9e6616cc3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.